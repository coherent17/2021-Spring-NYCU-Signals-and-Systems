clc;
clear;

x_initial_time = -1;
x_final_time = 2;
h_initial_time = -2;
h_final_time = 2;
y_initial_time = x_initial_time + h_initial_time;
y_final_time = x_final_time + h_final_time;

%input
subplot(2,2,1)
x1 = linspace(x_initial_time, x_final_time, (x_final_time-x_initial_time + 1));
x=[1,1,1,1];
stem(x1,x, LineWidth=2.5, MarkerSize=10);
xlim([-3,3]);
ylim([-1,2]);
xlabel('n', FontSize=20);
ylabel('Magnitude', FontSize=24);
title('x[n]', FontSize=24);
yticks([-1,0,1,2]);
grid on;

%impulse response
subplot(2,2,3)
h1 = linspace(h_initial_time, h_final_time, (h_final_time-h_initial_time + 1));
h=[1,-1,2,0,1];
stem(h1, h, LineWidth=2.5, MarkerSize=10);
xlim([-3,3]);
ylim([-2,3]);
xlabel('n', FontSize=24);
ylabel('Magnitude', FontSize=24);
title('h[n]', FontSize=24);
yticks([-2,-1,0,1,2,3]);
grid on;

%convolution
subplot(2,2,[2,4]);
y = conv(x,h);
n = linspace(y_initial_time,y_final_time, (y_final_time - y_initial_time + 1));
stem(n,y, LineWidth=2.5, MarkerSize=10);
xlabel('n', FontSize=24);
ylabel('y[n]', FontSize=24);
title('x[n]* h[n]', FontSize= 24);
xlim([-4 5]);
ylim([0,4]);
yticks([0,1,2,3,4]);
grid on;