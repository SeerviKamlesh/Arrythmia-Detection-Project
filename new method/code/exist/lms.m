function yd=lms(d)
% close all
N=length(d);

x=d+randn(1,N)*0.5;
w=zeros(1,N); 
% mu=input('mu = ');
mu=10^-4;
for i=1:N
   e(i) = d(i) - w(i)' * x(i);
   w(i+1) = w(i) + mu * e(i) * x(i);
%    pause
end
for i=1:N
yd(i) = sum(w(i)' * x(i));  
end
% subplot(221),plot(d),ylabel('Desired Signal'),
% subplot(222),plot(x),ylabel('Input Signal+Noise'),
% subplot(223),plot(e),ylabel('Error'),
% subplot(224),plot(yd),ylabel('Adaptive Desired output');