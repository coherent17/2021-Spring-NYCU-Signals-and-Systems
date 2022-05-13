clc;
clear;

n = (0:1:18);   %discrete time
N = 19;         %Period
x = 3*sin(12*pi/19*n)+2*cos(8*pi/19*n)+1;
X_DTFS=fft(x)/N;     %divide the analysis by period

X_DTFS_MAGNITUDE = abs(X_DTFS);
tolerance = 1e-6;
X_DTFS(X_DTFS_MAGNITUDE < tolerance) = 0; %remove the DTFS value less than tolerance
X_DTFS_PHASE = angle(X_DTFS);

subplot(1,2,1);
stem(n,X_DTFS_MAGNITUDE);
xlabel('k');
ylabel('|X[k]|');
title('Magnitude');

subplot(1,2,2);
stem(n,X_DTFS_PHASE);
xlabel('k');
ylabel('arg{X[k]}');
title('Phase');
