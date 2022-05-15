clc;
clear;

% build given original signal
n = (0:1:7);                  %discrete time
N = 8;                          %Period
x = [1,1,1,0,0,0,1,1];

%DTFS
X_DTFS = fft(x) / N;

%DTFT
X_DTFT = X_DTFS * 2 * pi;

%FT
Ts = 4;
X_CTFT = X_DTFT / Ts;

%Original signal
subplot(1,4,1);
stem(n,x);
xlabel('n');
ylabel('x[n]');
xlim([-1,8]);
ylim([0,2]);
grid on;
title('Original Signal');

% DTFS
subplot(1,4,2);
stem(n,X_DTFS);
xlabel('k');
ylabel('X[k]');
xlim([-1,8]);
grid on;
title('DTFS');

%DTFT
subplot(1,4,3)
stem(n,X_DTFT,Marker='^');
xlabel('\Omega');
ylabel('X(e^{j\Omega})');
xlim([-1,8]);
xticks([0 1 2 3 4 5 6 7]);
xticklabels({'0','\pi/4','\pi/2','3\pi/4','\pi','5\pi/4','3\pi/2','7\pi/4'});
grid on;
title('DTFT');

%FT
subplot(1,4,4)
stem(n,X_CTFT,Marker='^');
xlabel('\omega');
ylabel('X(j\omega)');
xlim([-1,8]);
xticks([0 1 2 3 4 5 6 7]);
xticklabels({'0','\pi/16','2\pi/16','3\pi/16','4\pi/16','5\pi/16','6\pi/16','7\pi/16'});
grid on;
title('FT');
