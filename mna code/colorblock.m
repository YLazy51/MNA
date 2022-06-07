function [out1 out2 out3 outrect]=colorblock(n,st,windowPtr,windowRect)

load('colorm.mat');
[xcenter,ycenter]=RectCenter(windowRect);%获取屏幕中心
for i=8
    temp(i,1)=i;
end

if n==5
    n=4;
end


colorid1=fernd(temp);
colorid2=colorid1';
colorid=colorid2(1,1:n);
frameRect1=[-100 100]+[xcenter ycenter];
frameRect2=[100 100]+[xcenter ycenter];
frameRect3=[100 -100]+[xcenter ycenter];
frameRect4=[-100 -100]+[xcenter ycenter];
% frameRect5=[-53 0-82]+[xcenter ycenter];

StimuRectLeft=[xcenter-25-100 ycenter-25 xcenter+25-100 ycenter+25];
StimuRectRight=[xcenter-25+100 ycenter-25 xcenter+25+100 ycenter+25];

FrameRect1=[frameRect1-25 frameRect1+25];
FrameRect2=[frameRect2-25 frameRect2+25];
FrameRect3=[frameRect3-25 frameRect3+25];
FrameRect4=[frameRect4-25 frameRect4+25];
% FrameRect5=[frameRect5-25 frameRect5+25];

if n==2
    Screen('FillRect',windowPtr,[colormmm(colorid(1,1),1:3)],StimuRectLeft);
    Screen('FillRect',windowPtr,[colormmm(colorid(1,2),1:3)],StimuRectRight);
elseif n==4
    Screen('FillRect',windowPtr,[colormmm(colorid(1,1),1:3)],FrameRect1);
     Screen('FillRect',windowPtr,[colormmm(colorid(1,2),1:3)],FrameRect2);
      Screen('FillRect',windowPtr,[colormmm(colorid(1,3),1:3)],FrameRect3);
      Screen('FillRect',windowPtr,[colormmm(colorid(1,4),1:3)],FrameRect4);
%        Screen('FillRect',windowPtr,[colormmm(colorid(1,5),1:3)],FrameRect5);
end
Screen('Flip',windowPtr);
WaitSecs(st);
Freamid=unidrnd(n);
if n==4
    eval(['outrect=FrameRect',num2str(Freamid)]);
elseif n==2
    if Freamid==1
        outrect=StimuRectLeft;
    else
        outrect=StimuRectRight;
    end
end

out1=colorid;
temm1=unidrnd(2*n);
while temm1==Freamid
temm1=unidrnd(2*n);
end
ppm=[colorid1(Freamid,1);colorid1(temm1,1)];
outcolorid=ppm(unidrnd(2),1);
out2=colormmm(outcolorid,1:3);%outcolor

out3=(colorid1(Freamid,1)==outcolorid);
% outnah=find(out1==out2);
% if outnah>=1
%     out3=1;
% else
%     out3=0;
% end

end
