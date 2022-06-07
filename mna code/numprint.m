function [flagout]=numprint(st,windowPtr,windowRect,posi)

Background=128;
ScreenNumber=0;
[xcenter,ycenter]=RectCenter(windowRect);%获取屏幕中心

num=zeros();
numout2=0;

signm=unidrnd(2);
if signm==1
    signmath='-';
else
    signmath='+';
end
%随机加减符号

num3=unidrnd(10)+10;

flagout=unidrnd(2)-1;

numleft=num3+unidrnd(11)-6;
while (~flagout&&(numleft==num3))

        numleft=num3+unidrnd(11)-6;
end
if flagout==1
    numleft=num3;
end




%随机生成两数�?
if signm==1
    num1=unidrnd(fix(numleft/2))+numleft;
   num2=num1-numleft;
else
    num1=unidrnd(fix(numleft/2))+fix(numleft/2);
    num2=numleft-num1;
end

%等号右边结果随机，范围为[正确结果-1 正确结果+1]

%输出参数 flagout，等式是否正确，0�?�?
type=[num2str(num1),signmath,num2str(num2),'=',num2str(num3)];%呈现的字符串内容

if posi==0
    xcenter=xcenter/2+100;
   
elseif posi==1
    xcenter=xcenter*3/2-300;
end
%随机呈现左右两侧 posi=0，左,1,�?

Screen('TextSize',windowPtr,50);
Screen('DrawText',windowPtr,double(type),xcenter,ycenter-50,[255 255 255]);

            Screen('Flip',windowPtr);
%呈现文字
            WaitSecs(st);

end