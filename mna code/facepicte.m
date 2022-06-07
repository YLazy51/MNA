function out=facepicte(picname1,picname2,st,windowPtr,windowRect)

load('stipic.mat');%加载图片
[xcenter,ycenter]=RectCenter(windowRect);

pic1=eval(picname1);
pic2=eval(picname2);%eval 将对应字符串名的变量内容存储

StimuRectLeft=[xcenter/2-150 ycenter-130 xcenter/2+150 ycenter+130];
StimuRectRight=[xcenter*3/2-150 ycenter-130 xcenter*3/2+150 ycenter+130];
%设置图片位置
facepict1=Screen('MakeTexture',windowPtr,pic1);%图片纹理化1
facepict2=Screen('MakeTexture',windowPtr,pic2);%图片纹理化2
Screen('DrawTexture',windowPtr,facepict1,[],StimuRectLeft);%画刺激1
Screen('DrawTexture',windowPtr,facepict2,[],StimuRectRight);%画刺激2
Screen('Flip',windowPtr);%呈现
WaitSecs(st);



end
