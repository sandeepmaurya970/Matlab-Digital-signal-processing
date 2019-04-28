clc; clear all; close all;
x=(0:0.01:2*pi);
y=sin(x);
plot(x,y);
grid on;
xlabel('x=0:2/pi');
ylabel('sine of x');
title('plot of the sine function');