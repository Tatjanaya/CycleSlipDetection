A=xlsread('C:\Users\冷凝\Desktop\有小周跳GPS数据.xls');  %导入数据
warning off;
L1=A(1:3543,4)'; %L1是L1载波


Pic1(1:3543)=0; 
Pic2(1:3543)=0;
Pic3(1:3543)=0;
Pic4(1:3543)=0;
 %预备画图

m=12;  %m个载波相位观测值

for i=1:(3543-m-1)
l=L1(i:(i+m));
t=A(i:(i+m-1),2)';
lt1=polyfit(t,l(1:m),5);
lt2=polyfit(t,l(1:m),6);
lt3=polyfit(t,l(1:m),7);
lt4=polyfit(t,l(1:m),8);

%拟合
lt=A(i:(i+m),2)';
y1=polyval(lt1,lt);
y2=polyval(lt2,lt);
y3=polyval(lt3,lt);
y4=polyval(lt4,lt);
%求中误差op


VV1=sum((y1(1:(m+1))-l(1:(m+1))).^2);
VV2=sum((y2(1:(m+1))-l(1:(m+1))).^2);
VV3=sum((y3(1:(m+1))-l(1:(m+1))).^2);
VV4=sum((y4(1:(m+1))-l(1:(m+1))).^2);
op1=sqrt(VV1/m);
op2=sqrt(VV2/m);
op3=sqrt(VV3/m);
op4=sqrt(VV4/m);



if abs(y1(m+1)-l(m+1)) >= op1*3  %发现周跳
fprintf('5次拟合探测\n %d\n',i+m);
Pic1(i) = y1(m+1)-l(m+1);
i = i+m;  %跳过周跳
end



if abs(y2(m+1)-l(m+1)) >= op2*3  %发现周跳
fprintf('6次拟合探测\n %d\n',i+m);
Pic2(i) = y2(m+1)-l(m+1);
i = i+m;  %跳过周跳
end



if abs(y3(m+1)-l(m+1)) >= op3*3  %发现周跳
fprintf('7次拟合探测\n %d\n',i+m);
Pic3(i) = y3(m+1)-l(m+1);
i = i+m;  %跳过周跳
end



if abs(y4(m+1)-l(m+1)) >= op4*3  %发现周跳
fprintf('8次拟合探测\n %d\n',i+m);
Pic4(i) = y4(m+1)-l(m+1);
i = i+m;  %跳过周跳
end

end

%画图
subplot(2,2,1);
plot(Pic1);
title('5次拟合');
subplot(2,2,2);
plot(Pic2);
title('6次拟合');
subplot(2,2,3);
plot(Pic3);
title('7次拟合');
subplot(2,2,4);
plot(Pic4);
title('8次拟合');
