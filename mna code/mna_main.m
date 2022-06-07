%by sfy 2022.5.10
%stipic.mat中存储了图片数据
%%
%准备及被试信息输入

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
titlename={'name(a-z&A-Z)','gender(0-female，1-male)','age(number)','id(number)'};
titlename1={'name(a-z&A-Z)','gender(0-female，1-male)','age(number)','id(number)'};
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



%subinfo[姓名 性别 年龄 编号]
%%
 %prepare keys 准备按键  F/J反应 退出键esc
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
    
    
    fid=fopen(filename,'w');%打开文件
    
   
  
    
    
    
    fprintf(fid,'%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\r\n','EMOTYPE','EMOLEVEL','LOADLEVEL','POSI1','POSI2','POSILOGI','ACCU1', 'ACCU2', 'RT1', 'RT2');
 %prepare sti pic
 
  load('stipic.mat')
  load('colorm.mat');
  load('key0.mat');
  %

%%
HideCursor; %隐藏鼠标的光标，以免实验过程中受到打扰 
Screen('Preference', 'SkipSyncTests', 1);
Background=128;
ScreenNumber=max(Screen('Screens'));
[windowPtr,windowRect]=Screen('OpenWindow',ScreenNumber,Background);
Screen('TextFont',windowPtr,'Simsun');%textfont更改 以支持drawtext显示中文
Screen('TextSize',windowPtr,50);%text宽度设置

frame_rate=Screen('FrameRate',windowPtr);%获取屏幕刷新率
framedur=1/frame_rate;%每一帧的时间长度
[xcenter,ycenter]=RectCenter(windowRect);%屏幕中心

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
Screen('DrawTexture',windowPtr,welcomet,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%呈现文字
Screen('Flip',windowPtr);
      
  end%while end
  WaitSecs(1);
  
  keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~keyIsDown
      
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      
      Screen('DrawTexture',windowPtr,zdyt1,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%呈现文字

Screen('Flip',windowPtr);
      
  end%while缁撴潫z
  WaitSecs(1);
  keyIsDown=keyIsDown0;KeyCode=KeyCode0
   while  ~keyIsDown
 
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      
     
 Screen('DrawTexture',windowPtr,prastat,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%呈现文字
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
    
    pic1=['S',sex,'L',picnum1];%图片1文件名
    pic2=['N',sex,'N',picnum1];%图片2文件名
    colorsize=fix(mod(i-1,10)/5)*3+2;;%2/5
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
    [colorout colortiprint colorflag colortorect]=colorblock(colorsize,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
              
             if position2(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             elseif position2(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%是否超时判断
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
  end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          %呈现文字
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
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    
        pic1=['S',sex,'S',picnum1];%楂樻偛浼?
        pic2=['N',sex,'N',picnum1];%图片2文件名
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
            [colorout colortiprint colorflag colortorect]=colorblock(colorsize,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%呈现刺激
             
              if position2(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             elseif position2(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
              end
           
            
    
 
              secs0=GetSecs;
               timeoutflag1=0;%是否超时判断
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
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
               
             timeoutflag2=0;%是否超时判断
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    
        pic1=['A',sex,'L',picnum1];%楂樻偛浼?
        pic2=['N',sex,'N',picnum1];%图片2文件名
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
            [colorout colortiprint colorflag colortorect]=colorblock(colorsize,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%呈现刺激
             
              if position2(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             elseif position2(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%是否超时判断
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
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
               
             timeoutflag2=0;%是否超时判断
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    
        pic1=['A',sex,'S',picnum1];%楂榝ennu
        pic2=['N',sex,'N',picnum1];%图片2文件名
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
            [colorout colortiprint colorflag colortorect]=colorblock(colorsize,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%呈现刺激
             
              if position2(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
             elseif position2(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position2(i,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%是否超时判断
            keyIsDown=keyIsDown0;KeyCode=KeyCode0
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
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
               
             timeoutflag2=0;%是否超时判断
             keyIsDown=keyIsDown0;KeyCode=KeyCode0
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
          %呈现文字



Screen('Flip',windowPtr);
WaitSecs(0.5);
 keyIsDown=keyIsDown0;KeyCode=KeyCode0;
   while  ~keyIsDown
      
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      
  end%while缁撴潫
%%
%姝ｅ紡瀹為獙

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
      Screen('DrawTexture',windowPtr,zdyt2,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%呈现文字
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
    
    pic1=['S',sex,'L',picnum1];%图片1文件名
    pic2=['N',sex,'N',picnum1];%图片2文件名
    
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
    [colorout colortiprint colorflag colortorect]=colorblock(5,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
             
             if position(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             elseif position(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%是否超时判断
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
  end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     WaitSecs(waitime);%涓や釜鍒ゆ柇闂撮殧锛岄槻姝㈠墠涓?鍒ゆ柇鎸夐敭鏈澗寮?Е鍙戝綋鍓嶅垽鏂?
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
        
      
               secs0=GetSecs;
               
             timeoutflag2=0;%是否超时判断
             
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    
        pic1=['S',sex,'S',picnum1];%楂樻偛浼?
        pic2=['N',sex,'N',picnum1];%图片2文件名
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
            [colorout colortiprint colorflag colortorect]=colorblock(5,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%呈现刺激
             
              if position(i-20,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
             elseif position(i-20,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%是否超时判断
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
           Screen('DrawTexture',windowPtr,wrongt,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);
          Screen('Flip',windowPtr);
          WaitSecs(0.5);
      end
     
      WaitSecs(waitime);%闃叉鍓嶄竴鍒ゆ柇鎸夐敭瑙﹀彂褰撳墠
     Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
      if colorflag==0
          colorreact=0;
      else
          colorreact=1;
      end
      
               secs0=GetSecs;
               
             timeoutflag2=0;%是否超时判断
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    %鍐欏叆閮ㄥ垎
    
    
end

WaitSecs(0.5);
[keyIsDown,secs,KeyCode] = KbCheck;
  while  ~keyIsDown
     [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      Screen('DrawTexture',windowPtr,zdyt2,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%呈现文字
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
    
    pic1=['A',sex,'L',picnum1];%浣庢劋鎬?
    pic2=['N',sex,'N',picnum1];%图片2文件名
    
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
    [colorout colortiprint colorflag colortorect]=colorblock(5,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
             
             if position(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             elseif position(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%是否超时判断
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
  end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
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
               
             timeoutflag2=0;%是否超时判断
             
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    
        pic1=['A',sex,'S',picnum1];%楂樻偛浼?
        pic2=['N',sex,'N',picnum1];%图片2文件名
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
            [colorout colortiprint colorflag colortorect]=colorblock(5,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%呈现刺激
             
              if position(i-20,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
             elseif position(i-20,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%是否超时判断
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
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
               
             timeoutflag2=0;%是否超时判断
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    %鍐欏叆閮ㄥ垎
    
    
end

WaitSecs(0.5);
[keyIsDown,secs,KeyCode] = KbCheck;
  while  ~keyIsDown
     [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      Screen('DrawTexture',windowPtr,zdyt2,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%呈现文字
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
    
    pic1=['S',sex,'L',picnum1];%图片1文件名
    pic2=['N',sex,'N',picnum1];%图片2文件名
    
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
    [colorout colortiprint colorflag colortorect]=colorblock(2,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
             
             if position(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             elseif position(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%是否超时判断
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
  end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
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
               
             timeoutflag2=0;%是否超时判断
             
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    
        pic1=['S',sex,'S',picnum1];%楂樻偛浼?
        pic2=['N',sex,'N',picnum1];%图片2文件名
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
            [colorout colortiprint colorflag colortorect]=colorblock(2,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%呈现刺激
             
              if position(i-20,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
             elseif position(i-20,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%是否超时判断
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
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
               
             timeoutflag2=0;%是否超时判断
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    %鍐欏叆閮ㄥ垎
    
    
end

WaitSecs(0.5);
[keyIsDown,secs,KeyCode] = KbCheck;
  while  ~keyIsDown
     [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      Screen('DrawTexture',windowPtr,zdyt2,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%呈现文字
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
    
    pic1=['A',sex,'L',picnum1];%图片1文件名
    pic2=['N',sex,'N',picnum1];%图片2文件名
    
    zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
    [colorout colortiprint colorflag colortorect]=colorblock(2,0.6,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
             
             if position(i,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             elseif position(i,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position(i,2));
             end
           
            secs0=GetSecs;
             timeoutflag1=0;%是否超时判断
             resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
  end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
    
      reacttime(i,1)=GetSecs-secs0;%rt1
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
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
               
             timeoutflag2=0;%是否超时判断
             
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
      Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
       Screen('Flip',windowPtr);
       if timeoutflag2==0
          continue
      end
       
            reacttime(i,2)=GetSecs-secs0;%rt2
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    
        pic1=['A',sex,'S',picnum1];%楂樻偛浼?
        pic2=['N',sex,'N',picnum1];%图片2文件名
    
   
   

    
            zhushidian(1,windowPtr,windowRect);
             Screen('Flip',windowPtr);%呈现刺激
            [colorout colortiprint colorflag colortorect]=colorblock(2,0.6,windowPtr,windowRect);
              Screen('Flip',windowPtr);%呈现刺激
             
              if position(i-20,1)==0
                     facepic(pic1,pic2,0.5,windowPtr,windowRect);
                     Screen('Flip',windowPtr);%呈现刺激
                     [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
             elseif position(i-20,1)==1
                 facepic(pic2,pic1,0.5,windowPtr,windowRect);
                 Screen('Flip',windowPtr);%呈现刺激
                 [numflag]=numprint(0,windowPtr,windowRect,position(i-20,2));
              end
           
            
           
 
              secs0=GetSecs;
               timeoutflag1=0;%是否超时判断
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
              resp(i,1:2) = nan; resp(i,1:2) = nan; accu(i,1:2) = nan;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %按键符合要求且在判断时限内
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag1=1;%超时判断
      if KeyCode(key_f)
                    resp(i,1)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,1)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      
      Screen('Flip',windowPtr);%呈现刺激
      
      if timeoutflag1==0
          continue
      end
      reacttime(i,1)=GetSecs-secs0;
      if numflag==resp(i,1)
            accu(i,1)=1;%准确率获取  
      else
          accu(i,1)=0;%准确率获取  
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
               
             timeoutflag2=0;%是否超时判断
              keyIsDown=keyIsDown0;KeyCode=KeyCode0;
  while  ~(keyIsDown && (KeyCode(key_f) || KeyCode(key_j) || KeyCode(EscapeKey)))&&(GetSecs-secs0<2)
      %琚瘯鏈?绉掓椂闂村仛鍑哄弽搴旓紝鍒ゆ柇琚瘯鍙嶅簲锛岃壊鍧椾换鍔″垽鏂?
       Screen('FillRect',windowPtr,colortiprint,colortorect);
     Screen('Flip',windowPtr);
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
      timeoutflag2=1;%超时判断
      if KeyCode(key_f)
                    resp(i,2)=0;
                    break;
      elseif KeyCode(key_j)
                    resp(i,2)=1;
                    break;
      elseif KeyCode(EscapeKey)
                    ShowCursor;sca;
              break;
      end%if鐨勭粨鏉?
      
 end%while缁撴潫
      if timeoutflag2==0
          continue
      end
            reacttime(i,2)=GetSecs-secs0;
      if colorreact==resp(i,2)
            accu(i,2)=1;%鑹插潡浠诲姟鍒ゆ柇姝ｇ‘
      else
          accu(i,2)=0;%鑹插潡浠诲姟鍒ゆ柇澶辫触
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
    %鍐欏叆閮ㄥ垎
    
    
end

WaitSecs(0.5);
[keyIsDown,secs,KeyCode] = KbCheck;
while  ~keyIsDown
     
 [keyIsDown,secs,KeyCode] = KbCheck;
      WaitSecs(0.001);
Screen('DrawTexture',windowPtr,thankst,[],[xcenter-640 ycenter-360 xcenter+640 ycenter+360]);%呈现文字
Screen('Flip',windowPtr);
      
  end%while缁撴潫
  
  fclose(fid);

sourcepath=char(pathfolder);
targetpath=[char(pathfolder),'\result'];
copyfile([sourcepath,'\',filename],targetpath);
ShowCursor;


Screen('CloseAll');
%%
%数据整合
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
%鏂囦欢缁撳熬閮ㄥ垎

%鍋囬殢鏈洪儴鍒嗭紝涓嶄細闅忔満鍒伴殢鏈鸿繃鐨勬儏鍐?
%鍑芥暟1 martixout=fernd(martixin) 灏嗗簭鍙烽殢鏈?


%娉ㄨ鐐瑰嚱鏁皕hushidian
%璋冪敤 zhushidian(鏃堕棿,windowPtr,windowRect)
%璋冪敤 numprint(鍛堢幇鏃堕棿,windowPtr,windowRect,posi)  posi浣嶇疆鍙傛暟
%璋冪敤colorblock(n,st,windowPtr,windowRect) 杈撳嚭1锛岀敤浜嗙殑棰滆壊 杈撳嚭2锛屽悗缁垽鏂鑹?杈撳嚭3
%find鍚庯紝鍒ゆ柇鏄惁涓?嚧
%璋冪敤 facepic(鍥剧墖1,鍥剧墖2,鍛堢幇鏃堕棿,windowPtr,windowRect) 鍥剧墖1鍦ㄥ乏渚?鍥剧墖2鍦ㄥ彸渚?


%%
