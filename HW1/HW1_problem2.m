clc;
clear;

%parameter setting
initial_time = 0;
final_time = 0.099;
N = 100; %grid number

t = linspace(initial_time, final_time, N);
x = 20 * cos(50 * pi * t - pi / 6);
y = x.^2;
sinusoid_component = 200 * cos(100 * pi * t - pi / 3); 
dc_component =  linspace(initial_time, final_time, N);
dc_component(1:100) = 200;
superposition = sinusoid_component + dc_component; 
y_mean = mean(y);
fprintf('mean of y(t) = %.2f\n', y_mean);

figure('units','normalized','outerposition',[0 0 1 1]);
subplot(1,2,1);
plot(t,x,'-r', LineWidth= 1.5);hold on;
plot(t,y,'-b', LineWidth= 1.5);hold on;
xlabel('time(sec)', FontSize= 20);
ylabel('Magnitude', FontSize=  20);
title('Plot x(t) and y(t)', FontSize= 24);
legend('x(t) = 20cos(50\pit-\pi/6)', 'y(t) = x^2(t)', Fontsize = 16);
grid on;

subplot(1,2,2);
plot(t,y,'-r', LineWidth= 1.5);hold on;
plot(t,sinusoid_component,'-g', LineWidth= 1.5);hold on;
plot(t,dc_component,'-b', LineWidth= 1.5);hold on;
plot(t,superposition,'xk', LineWidth= 1.5);hold on;
xlabel('time(sec)', FontSize= 20);
ylabel('Magnitude', FontSize=  20);
title('Decomposiotion of y(t)', FontSize= 24);
legend('y(t)', 'sinusoidal component', 'dc component','superposition' , Fontsize = 16);
grid on;

