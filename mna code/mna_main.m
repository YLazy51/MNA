%by sfy 2022.5.10
%stipic.mat�д洢��ͼƬ����
%%
%׼����������Ϣ����

clc;
clear;
close all;
typeflag=0;
zimuexp='[A-Z a-z]';
numexp='[0-9  ]';
genderexp='[0-1  ]';
default={'wuzhaohui','0','18','0'};
opts.Interpreter = 'tex';
opts.Resize = 'on';
titlename={'name(a-z&A-Z)','gender(0-female��1-male)','age(number)','id(number)'};
titlename1={'name(a-z&A-Z)','gender(0-female��1-male)','age(number)','id(number)'};
while ~typeflag


subinfo=inputdlg(titlename1,'pelase type sub info',[1 50],default,opts);
fg1=(size(char(subinfo(1,1)))==size(regexp(char(subinfo(1,1)),zimuexp)));
fg2=(size(char(subinfo(2,1)))==size(regexp(char(subinfo(2,1)),genderexp)));
fg3=(size(char(subinfo(3,1)))==size(regexp(char(subinfo(3,1)),numexp)));
fg4=(size(char(subinfo(4,1)))==size(regexp(char(subinfo(4,1)),numexp)));
typeflag3=[fg1(1,2) fg2(1,2) fg3(1,2) fg4(1,2)];


typeflag1=(fg1&fg2&fg3&fg4);
typeflag=(typeflag1(1,1)&&typeflag1(1,2));
if ~typeflag
    
      uiwait(msgbox('Invalid Value', 'Error','error','modal'));
       default=subinfo;
    for textcor=1:4
        if typeflag3(1,textcor)==0
            titlename1{1,textcor}=['\color{red} ',titlename{textcor}];
        else
            
             titlename1{1,textcor}=titlename{textcor};
            
        
        end
    end
  
    
   
end

end



subname=strrep(char(subinfo(1,1)),' ','');
subgender=strrep(char(subinfo(2,1)),' ','');
subage=strrep(char(subinfo(3,1)),' ','');
subid=strrep(char(subinfo(4,1)),' ','');

pathinfo=dir;
pathfolder=cd;
mkdir([char(pathfolder),'\result']);



%subinfo[���� �Ա� ���� ���]
%%
 %prepare keys ׼������  F/J��Ӧ �˳���esc
    KbName('UnifyKeyNames');
    key_f=KbName('f');
    key_j=KbName('j');
   
    spaceKey=KbName('SPACE');
    EscapeKey = KbName('ESCAPE');
    RestrictKeysForKbCheck([key_f,key_j,spaceKey,EscapeKey]);
 %prepare data files
  filename=['Sub_',subid,'_',subname,'_',subgender,'_',subage,'_mna.csv'];
    [pathi pathiii]=size(pathinfo);
    ppflag=0;
    filenum=0;
    filecflag=0;
    while ppflag==0
        pathinfo=dir;
        [pathi pathiii]=size(pathinfo);
        ppflag=1;
  for ppthi=1:pathi     
      if size(filename)==size(char(pathinfo(ppthi).name))
         if filename==char(pathinfo(ppthi).name)
          ppflag=0;
          filenum=filenum+1;
          filecflag=1;
         end
      end
  
  end
  
  if filecflag==1
    filename=['Sub_',subid,'_',subname,'_',subgender,'_',subage,'(',num2str(filenum),')','_mna.csv'];
    end
  
    end
    
    
    fid=fopen(filename,'w');%���ļ�
    
   
  
    
    
    
    fprintf(fid,'%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\r\n','EMOTYPE','EMOLEVEL','LOADLEVEL','POSI1','POSI2','POSILOGI','ACCU1', 'ACCU2', 'RT1', 'RT2');
 %prepare sti pic
 
  load('stipic.mat')
  load('colorm.mat');
  load('key0.mat');
  %

%%
HideCursor; %�������Ĺ�꣬����ʵ��������ܵ����� 
Screen('Preference', 'SkipSyncTests', 1);
Background=128;
ScreenNumber=max(Screen('Screens'));
[windowPtr,windowRect]=Screen('OpenWindow',ScreenNumber,Background);
Screen('TextFont',windowPtr,'Simsun');%textfont���� ��֧��drawtext��ʾ����
Screen('TextSize',windowPtr,50);%text�������

frame_rate=Screen('FrameRate',windowPtr);%��ȡ��Ļˢ����
framedur=1/frame_rate;%ÿһ֡��ʱ�䳤��
[xcenter,ycenter]=RectCenter(windowRect);%��Ļ����

picinfo={'S','M','L';'A','F','H';'N','',''}
zdy=imread('zdq.png');
zdyt1=Screen('MakeTexture',windowPtr,zdy);
zdy2=imread('zdq2.png');
zdyt2=Screen('MakeTexture',windowPtr,zdy2);
wrong=imread('wrong.png');
welcome=imread('welcome.png');
wrongt=Screen('MakeTexture',windowPtr,wrong);
welcomet=Screen('MakeTexture',windowPtr,welcome);
presta=imread('presta.png');
prastat=Screen('MakeTexture',windowPtr,presta);
praend=imread('praend.png');
praendt=Screen('MakeTexture',windowPtr,praend);
thanks=imread('thanks.png');
thankst=Screen('MakeTexture',windowPtr,thanks);
waitime=0.3;

keyIsDown=keyIsDown0;KeyCode=KeyCode0
while  ~keyIsDown
     
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
Screen('DrawTexture',windowPtr,welcomet,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%��������
Screen('Flip',windowPtr);
      
  end%while end
  WaitSecs(1);
  
  keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~keyIsDown
      
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      
      Screen('DrawTexture',windowPtr,zdyt1,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%��������

Screen('Flip',windowPtr);
      
  end%while结束z
  WaitSecs(1);
  keyIsDown=keyIsDown0;KeyCode=KeyCode0
   while  ~keyIsDown
 
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      
     
 Screen('DrawTexture',windowPtr,prastat,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%��������
Screen('Flip',windowPtr);
      
  end%
  
  WaitSecs(1);
  

%%
%pratice trial 40
acurate=zeros();
sexid1=1:1:40;
sexid=sexid1';
sexorder=fernd(sexid);
postition1(1:20,1:3)=posirnd;
position2(1:40,1:3)=[postition1;postition1];


while acurate(1,1)<0.7
    
    keyIsDown=keyIsDown0;KeyCode=KeyCode0
    
for i=1:40
    resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
    if i<=10
     if mod(sexid(sexorder(i,1),1),2)==1
        sex='M';
    else
        sex='F';
    end
    picnum1=char(num2str(unidrnd(6)));
    picnum2=char(num2str(unidrnd(6)));
    
    pic1=['S',sex,'L',picnum1];%ͼƬ1�ļ���
    pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    colorsize=fix(mod(i-1,10)/5)*3+2;;%2/5
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
    [colorout colortiprint colorflag colortorect]=colorblock(colorsize,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
              
             if position2(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             elseif position2(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%�Ƿ�ʱ�ж�
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
  end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          %��������
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
   
      
               secs0=GetSecs;
               
             timeoutflag2=0;%
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %i<=20
    elseif i<=20%i>10
         if mod(sexid(sexorder(i,1),1),2)==1
            sex='M';
         else
            sex='F';
         end
        picnum1=char(num2str(unidrnd(6)));
        picnum2=char(num2str(unidrnd(6)));
    
        pic1=['S',sex,'S',picnum1];%高悲�?
        pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
            [colorout colortiprint colorflag colortorect]=colorblock(colorsize,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%���ִ̼�
             
              if position2(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             elseif position2(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
              end
           
            
    
 
              secs0=GetSecs;
               timeoutflag1=0;%�Ƿ�ʱ�ж�
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
      
 
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %20<i<=40
    
    
    elseif i<=30%i>10
         if mod(sexid(sexorder(i,1),1),2)==1
            sex='M';
         else
            sex='F';
         end
        picnum1=char(num2str(unidrnd(6)));
        picnum2=char(num2str(unidrnd(6)));
    
        pic1=['A',sex,'L',picnum1];%高悲�?
        pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
            [colorout colortiprint colorflag colortorect]=colorblock(colorsize,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%���ִ̼�
             
              if position2(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             elseif position2(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%�Ƿ�ʱ�ж�
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
      
 
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     elseif i<=40%i>10
         if mod(sexid(sexorder(i,1),1),2)==1
            sex='M';
         else
            sex='F';
         end
        picnum1=char(num2str(unidrnd(6)));
        picnum2=char(num2str(unidrnd(6)));
    
        pic1=['A',sex,'S',picnum1];%高fennu
        pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
            [colorout colortiprint colorflag colortorect]=colorblock(colorsize,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%���ִ̼�
             
              if position2(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             elseif position2(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%�Ƿ�ʱ�ж�
            keyIsDown=keyIsDown0;KeyCode=KeyCode0
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
      
 
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %20<i<=40
    
    end

    %20<i<=40



end
acurate(1,1)=sum(accu(1:40,1))/40;
acurate(1,2)=sum(accu(1:40,2))/40;
     Screen('DrawText',windowPtr,double(['Your accuracy rate is:',char(num2str(acurate(1,1),4))]) ,xcenter-100,ycenter-25,[255 0 0]);
          Screen('Flip',windowPtr);
          WaitSecs(1);
          if acurate(1,1)<0.7
              Screen('DrawText',windowPtr,double('The accuracy rate is too low.Practice again after 5 seconds:'),xcenter-350,ycenter-25,[255 0 0]);
                Screen('Flip',windowPtr);
          WaitSecs(5);
          end
end
sexid=zeros();
sexid1=zeros();
sexorder=zeros();





Screen('DrawTexture',windowPtr,praendt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          %��������



Screen('Flip',windowPtr);
WaitSecs(0.5);
 keyIsDown=keyIsDown0;KeyCode=KeyCode0;
   while  ~keyIsDown
      
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      
  end%while结束
%%
%正式实验

%high memory load
%sad part
sexid1=1:1:40;
sexid=sexid1';
sexorder=fernd(sexid);
position(1:20,1:3)=posirnd;%position[task1posi task2posi same/diff]
%0 left,1 right
WaitSecs(0.5);
keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~keyIsDown
     [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      Screen('DrawTexture',windowPtr,zdyt2,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%��������
Screen('Flip',windowPtr);
  end
for i=1:40
    resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
    if i<=20
     if mod(sexid(sexorder(i,1),1),2)==1
        sex='M';
    else
        sex='F';
    end
    picnum1=char(num2str(unidrnd(6)));
    picnum2=char(num2str(unidrnd(6)));
    
    pic1=['S',sex,'L',picnum1];%ͼƬ1�ļ���
    pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
    [colorout colortiprint colorflag colortorect]=colorblock(5,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
             
             if position(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             elseif position(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%�Ƿ�ʱ�ж�
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
  end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     WaitSecs(waitime);%两个判断间隔，防止前�?��判断按键未松�?��发当前判�?
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
        
      
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
             
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %i<=20
    else%i>20
         if mod(sexid(sexorder(i,1),1),2)==1
            sex='M';
         else
            sex='F';
         end
        picnum1=char(num2str(unidrnd(6)));
        picnum2=char(num2str(unidrnd(6)));
    
        pic1=['S',sex,'S',picnum1];%高悲�?
        pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
            [colorout colortiprint colorflag colortorect]=colorblock(5,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%���ִ̼�
             
              if position(i-20,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
             elseif position(i-20,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%�Ƿ�ʱ�ж�
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
      WaitSecs(waitime);%防止前一判断按键触发当前
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
      
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %20<i<=40
    
    end
    
    
    if i<=20
        fprintf(fid,'%s,%s,%s,%d,%d,%d,%f,%f,%f,%f\r\n','SAD','LOW','HIGH',position(i,1),position(i,2),position(i,3),accu(i,1),accu(i,2),reacttime(i,1),reacttime(i,2));
    elseif i<=40
        fprintf(fid,'%s,%s,%s,%d,%d,%d,%f,%f,%f,%f\r\n','SAD','STRONG','HIGH',position(i-20,1),position(i-20,2),position(i-20,3),accu(i,1),accu(i,2),reacttime(i,1),reacttime(i,2));
    end
    %写入部分
    
    
end

WaitSecs(0.5);
[keyIsDown,secs,KeyCode] = KbCheck;
  while  ~keyIsDown
     [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      Screen('DrawTexture',windowPtr,zdyt2,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%��������
Screen('Flip',windowPtr);
  end
%angry part
sexid1=1:1:40;
sexid=sexid1';
sexorder=fernd(sexid);
position(1:20,1:3)=posirnd;%position[task1posi task2posi same/diff]
%0 left,1 right
for i=1:40
    resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
    if i<=20
     if mod(sexid(sexorder(i,1),1),2)==1
        sex='M';
    else
        sex='F';
    end
    picnum1=char(num2str(unidrnd(6)));
    picnum2=char(num2str(unidrnd(6)));
    
    pic1=['A',sex,'L',picnum1];%低愤�?
    pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
    [colorout colortiprint colorflag colortorect]=colorblock(5,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
             
             if position(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             elseif position(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%�Ƿ�ʱ�ж�
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
  end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
       
      
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
             
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %i<=20
    else%i>20
         if mod(sexid(sexorder(i,1),1),2)==1
            sex='M';
         else
            sex='F';
         end
        picnum1=char(num2str(unidrnd(6)));
        picnum2=char(num2str(unidrnd(6)));
    
        pic1=['A',sex,'S',picnum1];%高悲�?
        pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
            [colorout colortiprint colorflag colortorect]=colorblock(5,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%���ִ̼�
             
              if position(i-20,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
             elseif position(i-20,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%�Ƿ�ʱ�ж�
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
      
     
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %20<i<=40
    
    end
    
    
    if i<=20
        fprintf(fid,'%s,%s,%s,%d,%d,%d,%f,%f,%f,%f\r\n','ANGRY','LOW','HIGH',position(i,1),position(i,2),position(i,3),accu(i,1),accu(i,2),reacttime(i,1),reacttime(i,2));
    elseif i<=40
        fprintf(fid,'%s,%s,%s,%d,%d,%d,%f,%f,%f,%f\r\n','ANGRY','STRONG','HIGH',position(i-20,1),position(i-20,2),position(i-20,3),accu(i,1),accu(i,2),reacttime(i,1),reacttime(i,2));
    end
    %写入部分
    
    
end

WaitSecs(0.5);
[keyIsDown,secs,KeyCode] = KbCheck;
  while  ~keyIsDown
     [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      Screen('DrawTexture',windowPtr,zdyt2,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%��������
Screen('Flip',windowPtr);
  end
%low memory load
%SAD part

sexid1=1:1:40;
sexid=sexid1';
sexorder=fernd(sexid);
position(1:20,1:3)=posirnd;%position[task1posi task2posi same/diff]
%0 left,1 right
for i=1:40
    resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
    if i<=20
     if mod(sexid(sexorder(i,1),1),2)==1
        sex='M';
    else
        sex='F';
    end
    picnum1=char(num2str(unidrnd(6)));
    picnum2=char(num2str(unidrnd(6)));
    
    pic1=['S',sex,'L',picnum1];%ͼƬ1�ļ���
    pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
    [colorout colortiprint colorflag colortorect]=colorblock(2,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
             
             if position(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             elseif position(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%�Ƿ�ʱ�ж�
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
  end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
   
      
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
             
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %i<=20
    else%i>20
         if mod(sexid(sexorder(i,1),1),2)==1
            sex='M';
         else
            sex='F';
         end
        picnum1=char(num2str(unidrnd(6)));
        picnum2=char(num2str(unidrnd(6)));
    
        pic1=['S',sex,'S',picnum1];%高悲�?
        pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
            [colorout colortiprint colorflag colortorect]=colorblock(2,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%���ִ̼�
             
              if position(i-20,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
             elseif position(i-20,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%�Ƿ�ʱ�ж�
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
      
 
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %20<i<=40
    
    end
    
    
    if i<=20
        fprintf(fid,'%s,%s,%s,%d,%d,%d,%f,%f,%f,%f\r\n','SAD','LOW','HIGH',position(i,1),position(i,2),position(i,3),accu(i,1),accu(i,2),reacttime(i,1),reacttime(i,2));
    elseif i<=40
        fprintf(fid,'%s,%s,%s,%d,%d,%d,%f,%f,%f,%f\r\n','SAD','STRONG','HIGH',position(i-20,1),position(i-20,2),position(i-20,3),accu(i,1),accu(i,2),reacttime(i,1),reacttime(i,2));
    end
    %写入部分
    
    
end

WaitSecs(0.5);
[keyIsDown,secs,KeyCode] = KbCheck;
  while  ~keyIsDown
     [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      Screen('DrawTexture',windowPtr,zdyt2,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%��������
Screen('Flip',windowPtr);
  end
  
%ANGRY PART

sexid1=1:1:40;
sexid=sexid1';
sexorder=fernd(sexid);
position(1:20,1:3)=posirnd;%position[task1posi task2posi same/diff]
%0 left,1 right
for i=1:40
    resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
    if i<=20
     if mod(sexid(sexorder(i,1),1),2)==1
        sex='M';
    else
        sex='F';
    end
    picnum1=char(num2str(unidrnd(6)));
    picnum2=char(num2str(unidrnd(6)));
    
    pic1=['A',sex,'L',picnum1];%ͼƬ1�ļ���
    pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
    [colorout colortiprint colorflag colortorect]=colorblock(2,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
             
             if position(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             elseif position(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%�Ƿ�ʱ�ж�
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
  end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
   
      
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
             
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %i<=20
    else%i>20
         if mod(sexid(sexorder(i,1),1),2)==1
            sex='M';
         else
            sex='F';
         end
        picnum1=char(num2str(unidrnd(6)));
        picnum2=char(num2str(unidrnd(6)));
    
        pic1=['A',sex,'S',picnum1];%高悲�?
        pic2=['N',sex,'N',picnum1];%ͼƬ2�ļ���
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%���ִ̼�
            [colorout colortiprint colorflag colortorect]=colorblock(2,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%���ִ̼�
             
              if position(i-20,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%���ִ̼�
                     [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
             elseif position(i-20,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%���ִ̼�
                 [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%�Ƿ�ʱ�ж�
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %��������Ҫ�������ж�ʱ����
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      
      Screen('Flip',windowPtr);%���ִ̼�
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%׼ȷ�ʻ�ȡ  
      else
          accu(i,1)=0;%׼ȷ�ʻ�ȡ  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
      
      WaitSecs(waitime);
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
      
 
               secs0=GetSecs;
               
             timeoutflag2=0;%�Ƿ�ʱ�ж�
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %被试�?秒时间做出反应，判断被试反应，色块任务判�?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%��ʱ�ж�
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if的结�?
      
 end%while结束
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%色块任务判断正确
      else
          accu(i,2)=0;%色块任务判断失败
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
    %20<i<=40
    
    end
    
    
    if i<=20
        fprintf(fid,'%s,%s,%s,%d,%d,%d,%f,%f,%f,%f\r\n','ANGRY','LOW','LOW',position(i,1),position(i,2),position(i,3),accu(i,1),accu(i,2),reacttime(i,1),reacttime(i,2));
    elseif i<=40
        fprintf(fid,'%s,%s,%s,%d,%d,%d,%f,%f,%f,%f\r\n','ANGRY','STRONG','LOW',position(i-20,1),position(i-20,2),position(i-20,3),accu(i,1),accu(i,2),reacttime(i,1),reacttime(i,2));
    end
    %写入部分
    
    
end

WaitSecs(0.5);
[keyIsDown,secs,KeyCode] = KbCheck;
while  ~keyIsDown
     
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
Screen('DrawTexture',windowPtr,thankst,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%��������
Screen('Flip',windowPtr);
      
  end%while结束
  
  fclose(fid);

sourcepath=char(pathfolder);
targetpath=[char(pathfolder),'\result'];
copyfile([sourcepath,'\',filename],targetpath);
ShowCursor;


Screen('CloseAll');
%%
%��������
zhinfo=dir(fullfile(targetpath,'*.csv'));

[zhi zhhhh]=size(zhinfo);
temall=zeros();
for i=1:zhi
    
    [xc1 xc2 temcsv]=xlsread(fullfile(targetpath,zhinfo(i).name))
    if i==1
        temall=temcsv;
    else
         temall=[temall;temcsv];
    
    end
    
end
xlswrite(fullfile(targetpath,'dataall.xlsx'),temall);

yvalue=[0 0 0 0 0 0 0 0];
ytrial=[0 0 0 0 0 0 0 0];
poxdex=[1 2 3 4 5 6 7 8];
[xc1 xc2 temfile]=xlsread(filename);
[x y]=size(temfile);
x=x-1;
for xi=2:x
if strcmp(char(temfile(xi,1)),'SAD')
    xdex(xi,1)=0;
else
    xdex(xi,1)=1;
end
if strcmp(char(temfile(xi,2)),'LOW')
    xdex(xi,2)=0;
else
    xdex(xi,2)=1;
end
if strcmp(char(temfile(xi,3)),'LOW')
    xdex(xi,3)=0;
else
    xdex(xi,3)=1;
end

if strcmp(char(num2str(cell2mat(temfile(xi,6)))),'0')
    xdex(xi,4)=0;
else
    xdex(xi,4)=1;
end



potx=xdex(xi,2)*2+xdex(xi,3)+1+xdex(xi,4)*4;

yvalue(1,potx)=cell2mat(temfile(xi,9))+yvalue(1,potx);
ytrial(1,potx)=+ytrial(1,potx)+1;


end
yvalue1=yvalue./ytrial;
plot(poxdex,yvalue1,'k*');





%%
%文件结尾部分

%假随机部分，不会随机到随机过的情�?
%函数1 martixout=fernd(martixin) 将序号随�?


%注视点函数zhushidian
%调用 zhushidian(时间,windowPtr,windowRect)
%调用 numprint(呈现时间,windowPtr,windowRect,posi)  posi位置参数
%调用colorblock(n,st,windowPtr,windowRect) 输出1，用了的颜色 输出2，后续判断颜�?输出3
%find后，判断是否�?��
%调用 facepic(图片1,图片2,呈现时间,windowPtr,windowRect) 图片1在左�?图片2在右�?


%%
