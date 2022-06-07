function zsp=zsdfr(windowPtr,windowRect)
Background=128;
ScreenNumber=0;
length=15;%注视点长度
  width=5;%注视点宽度

[xcenter,ycenter]=RectCenter(windowRect);%获取屏幕中心点


   Screen('DrawLines',windowPtr,[xcenter-length xcenter+length;ycenter ycenter],width,[255 255 255]);
   Screen('DrawLines',windowPtr,[xcenter xcenter;ycenter-length ycenter+length],width,[255 255 255]);
%画
          

end