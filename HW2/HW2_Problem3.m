clc;
clear;

z_initial_time = -1;
z_final_time = 1;
f_initial_time = -1;
f_final_time = 1;
y_initial_time = z_initial_time + f_initial_time;
y_final_time = z_final_time + f_final_time;

subplot(2,2,1);
tz = z_initial_time:0.001:z_final_time;
z = generate_z(tz);
plot(tz,z, LineWidth=1.5);
ylim([-1.5,1.5]);
xlabel('t');
ylabel('Magnitude');
title('z(t)', FontSize=16);
grid on;

subplot(2,2,3);
tf = f_initial_time:0.001:f_final_time;
f = impulse_response(tf);
plot(tf,f, LineWidth=1.5);
xlabel('t');
ylabel('Magnitude');
title('f(t)', FontSize=16);
ylim([0,1]);
grid on;

subplot(2,2,[2,4]);
y = conv(z,f,'same') * 0.001;
ty = y_initial_time:(y_final_time - y_initial_time)/(length(y) - 1):y_final_time;
sol = mysolution(ty);
plot(ty,y,LineWidth=1.5);hold on;
plot(ty, sol, LineWidth=1.5);hold on;
xlabel('t');
ylabel("Magnitude");
legend('conv()', 'mysolution', Fontsize = 16);
title('Convolution by Matlab & Manual Solution', FontSize=16);
grid on;

function z = generate_z(t)
    sz = size(t);
    z = ones(sz);
    for i = 1 : sz(2)
        if t(i) <= 0
            z(i) = -1;
        else
            z(i) = 1;
        end
    end
end

function h = impulse_response(t)
    sz = size(t);
    h = ones(sz);
    for i = 1 : sz(2)
        if t(i)>=0
            h(i) = exp(-t(i));
        else
            h(i) = 0;
        end
    end
end

function sol = mysolution(t)
    sz = size(t);
    sol = ones(sz);
    for i = 1: sz(2)
        if t(i) < 0 && t(i) >=-1
            sol(i) = exp(-t(i)-1)-1;
        elseif t(i)>=0 && t(i) < 1
            sol(i) = -2 * exp(-t(i)) + exp(-1) + 1;
        elseif t(i) >=1 && t(i) <= 2
            sol(i) = exp(-t(i)+1)-exp(-1);
        else
            sol(i) = 0;
        end
    end
end