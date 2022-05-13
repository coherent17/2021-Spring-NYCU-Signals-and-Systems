clc;
clear;

k = (0:1:14);   %frequency domain discrete index
N = 15;         %Period
Magnitude_X = [1,1,1,1,1,0,0,0,0,0,0,1,1,1,1];
Phase_X = [-pi/6*0,-pi/6*1,-pi/6*2,-pi/6*3,-pi/6*4,0,0,0,0,0,0,-pi/6*(-4),-pi/6*(-3),-pi/6*(-2),-pi/6*(-1)];
X = Magnitude_X .* exp(1j*Phase_X);
x = ifft(X);
x = x * N;

x_actual = sin(4.5*pi*(2*k/15-1/6)) ./ sin(0.5*pi*(2*k/15-1/6));

subplot(1,3,1);
stem(k,x);
xlabel('n');
ylabel('x[n]');
title('x[n]');

subplot(1,3,2);
stem(k,Magnitude_X);
xlabel('k');
ylabel('|X[k]|');
title('Magnitude');

subplot(1,3,3);
stem(k,Phase_X);
xlabel('k');
ylabel('arg{X[k]}');
title('Phase');