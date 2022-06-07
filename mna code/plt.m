filename='D:\桌面\mna5.19\result\Sub_0_sfy_0_20_mna.csv';
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
