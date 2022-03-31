clc;
clear;

A = 1;
w0 = 10 * pi;
t = 0:.001:1;

%square wave
square_signal = A * square(w0 * t, 50);

%triangular signal
triangular_signal = A * sawtooth(w0 * t, 0.5);

%discrete square wave
omega = pi / 4;
n = -10:10;
x = A * square(omega * n);

%visualize
subplot(1,2,1);
plot(t, square_signal); hold on;
plot(t, triangular_signal); hold on;
axis([0 1 -1.1 1.1]);

subplot(1,2,2);
stem(n,x);