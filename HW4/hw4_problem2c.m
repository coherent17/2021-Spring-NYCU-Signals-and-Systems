clc;
clear;

% X(jw)=sigma (k=-inf:inf) [2sin(2kpi/3)/k + 4sin(kpi/3)/k] * delta(w-k*2/3pi)

k = (0:1:10);
omega = k*2*pi/3;
X_FT = 2*sin(k.*2*pi/3)./k+4*sin(k.*pi/3)./k;
X_FT(1)=8*pi/3;

X_FT_MAGNITUDE = abs(X_FT);
tolerance = 1e-6;
X_FT(X_FT_MAGNITUDE < tolerance) = 0;
X_FT_PHASE = angle(X_FT);

subplot(1,2,1);
stem(omega,X_FT_MAGNITUDE,'^');
xlabel('\omega');
ylabel('|X(j\omega)|');
xticks(omega);
xticklabels({'0','2\pi/3','4\pi/3','2\pi','8\pi/3','10\pi/3','4\pi','14\pi/3','16\pi/3','3\pi','20\pi/3'});
xlim([-1,7*pi]);
title('Magnitude');
grid on;

subplot(1,2,2);
stem(omega,X_FT_PHASE);
xlabel('\omega');
ylabel('arg{X(j\omega)}');
xticks(omega);
xticklabels({'0','2\pi/3','4\pi/3','2\pi','8\pi/3','10\pi/3','4\pi','14\pi/3','16\pi/3','3\pi','20\pi/3'});
xlim([-1,7*pi]);
title('Phase');
grid on;
