titlename={'subname','gender','age','subid'};
default={'testname','0','18','0'};
subinfo=inputdlg(titlename,'请输入',[1 30;1 30;1 30;1 30],default);
subname=char(subinfo(1,1))
sub