
clc; clear all; close all;
x=input('enter the first sequence');
h=input('enter the second sequence');
y=conv(x,h);
figure; subplot(3,1,1);
stem(x); ylabel('amplitude-->');
xlabel('(a)n-->');
title('first sequence');
subplot(3,1,2);
stem(h);ylabel ('amplitude-->');
xlabel ('(b) n-->0');
title('second sequence');
subplot(3,1,3);
stem(y); ylabel ('amplitude-->');
xlabel ('(c) n-->');
title('the resulted of signal is after convolution ');