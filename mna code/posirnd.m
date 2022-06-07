function outpos=posirnd(a)
alpha=ones(10,1);
alpha=[alpha;zeros(10,1)];
alpha1=fernd(alpha);
alpha2=fernd(alpha);
for rm=1:20
alphaa(rm,1)=alpha(alpha1(rm,1),1);
alphab(rm,1)=alpha(alpha2(rm,1),1);
if alphab(rm,1)==1
    alphac(rm,1)=alphaa(rm,1);
else
    alphac(rm,1)=~alphaa(rm,1);
end

end
posit1(1:20,1:3)=[alphaa alphac alphab];%[task1_posi task2_posi posi_logi]
outpos(1:20,1:3)=posit1(1:20,1:3);
end

