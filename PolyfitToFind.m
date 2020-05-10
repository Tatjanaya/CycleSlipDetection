A=xlsread('C:\Users\����\Desktop\��С����GPS����.xls');  %��������
warning off;
L1=A(1:3543,4)'; %L1��L1�ز�


Pic1(1:3543)=0; 
Pic2(1:3543)=0;
Pic3(1:3543)=0;
Pic4(1:3543)=0;
 %Ԥ����ͼ

m=12;  %m���ز���λ�۲�ֵ

for i=1:(3543-m-1)
l=L1(i:(i+m));
t=A(i:(i+m-1),2)';
lt1=polyfit(t,l(1:m),5);
lt2=polyfit(t,l(1:m),6);
lt3=polyfit(t,l(1:m),7);
lt4=polyfit(t,l(1:m),8);

%���
lt=A(i:(i+m),2)';
y1=polyval(lt1,lt);
y2=polyval(lt2,lt);
y3=polyval(lt3,lt);
y4=polyval(lt4,lt);
%�������op


VV1=sum((y1(1:(m+1))-l(1:(m+1))).^2);
VV2=sum((y2(1:(m+1))-l(1:(m+1))).^2);
VV3=sum((y3(1:(m+1))-l(1:(m+1))).^2);
VV4=sum((y4(1:(m+1))-l(1:(m+1))).^2);
op1=sqrt(VV1/m);
op2=sqrt(VV2/m);
op3=sqrt(VV3/m);
op4=sqrt(VV4/m);



if abs(y1(m+1)-l(m+1)) >= op1*3  %��������
fprintf('5�����̽��\n %d\n',i+m);
Pic1(i) = y1(m+1)-l(m+1);
i = i+m;  %��������
end



if abs(y2(m+1)-l(m+1)) >= op2*3  %��������
fprintf('6�����̽��\n %d\n',i+m);
Pic2(i) = y2(m+1)-l(m+1);
i = i+m;  %��������
end



if abs(y3(m+1)-l(m+1)) >= op3*3  %��������
fprintf('7�����̽��\n %d\n',i+m);
Pic3(i) = y3(m+1)-l(m+1);
i = i+m;  %��������
end



if abs(y4(m+1)-l(m+1)) >= op4*3  %��������
fprintf('8�����̽��\n %d\n',i+m);
Pic4(i) = y4(m+1)-l(m+1);
i = i+m;  %��������
end

end

%��ͼ
subplot(2,2,1);
plot(Pic1);
title('5�����');
subplot(2,2,2);
plot(Pic2);
title('6�����');
subplot(2,2,3);
plot(Pic3);
title('7�����');
subplot(2,2,4);
plot(Pic4);
title('8�����');
