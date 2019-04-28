clc; close all; clear all;
rp= input('enter the passband ripple');
rs= input('enter the stopband ripple');
fp= input('enter the passband freq');
fs= input('enter the stopband freq');
f=input('enter the sampling freq');
wp= 2*fp/f;
ws= 2*fs/f;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/f;
n=ceil(num/dem);
n1=n+1;
if (rem(n,2)~=0)
    n1=n;
    n=n-1;
end
y=boxcar(n1);
%low pass
b=fir1(n,wp,y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,2,1);
plot(o/pi,m);
ylabel('Gain in dB==>');
xlabel('(a) Normalised frequency==>');
title('Low pass filter');
%high passs
b=fir1(n,wp,'high',y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,2,2);
plot(o/pi,m);
ylabel('Gain in dB==>');
xlabel('(b) Normalised frequency==>');
title('High pass filter');
%band pass
b=fir1(n,wp,y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,2,3);
plot(o/pi,m);
ylabel('Gain in dB==>');
xlabel('(c) Normalised frequency==>');
title('Band pass filter');
%band stop
b=fir1(n,wp,'stop',y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,2,4);
plot(o/pi,m);
ylabel('Gain in dB==>');
xlabel('(d) Normalised frequency==>');
title('Band stop filter');
