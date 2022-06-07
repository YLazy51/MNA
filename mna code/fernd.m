function martixout=fernd(martixin)
    [rdy,rdx]=size(martixin);
    for rdi=1:rdy
        martixin2(rdi,1:2)=[rdi 1];% [id 原矩阵数据 flag]
    end
    rdi2=1;
     martixout1=zeros();
    while rdi2<=rdy
        randnum=unidrnd(rdy);
        if martixin2(randnum,2)==1
            martixin2(randnum,2)=0;
            martixout1(rdi2,1)=randnum;
            rdi2=rdi2+1;
        end
    end
    martixout=martixout1;
end