clc;
clear;

unit_step_function = [zeros(1,50), ones(1,50)];
delta_function = [zeros(1,49), 1, zeros(1,49)];

plot(unit_step_function); hold on;
plot(delta_function); hold on;
axis([0 100 -0.1 1.1]);