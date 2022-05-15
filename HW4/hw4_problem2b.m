clc;
clear;

% X(jw)=sigma (k=0:4) [(-1)^k/(k+1)]{pi*delta(w-(2k+1)*pi) + pi*delta(w+(2k+1)*pi)}
% k = 0: ( 1/1)*[pi*delta(w-1*pi)+pi*delta(w+1*pi)]
% k = 1: (-1/2)*[pi*delta(w-3*pi)+pi*delta(w+3*pi)]
% k = 2: ( 1/3)*[pi*delta(w-5*pi)+pi*delta(w+5*pi)]
% k = 3: (-1/4)*[pi*delta(w-7*pi)+pi*delta(w+7*pi)]
% k = 4: ( 1/5)*[pi*delta(w-9*pi)+pi*delta(w+9*pi)]

omega = [-9*pi,-7*pi,-5*pi,-3*pi,-pi,pi,3*pi,5*pi,7*pi,9*pi];
X_FT_Magnitude = [1/5,1/4,1/3,1/2,1,1,1/2,1/3,1/4,1/5] * pi;
X_FT_Phase = [0,pi,0,pi,0,0,pi,0,pi,0];

subplot(1,2,1);
stem(omega,X_FT_Magnitude,'^');
xticks(omega);
xticklabels({'-9\pi','-7\pi','-5\pi','-3\pi','-\pi','\pi','3\pi','5\pi','7\pi','9\pi'});
xlabel('\omega');
ylabel('|X(j\omega)|');
title('Magnitude');
grid on;

subplot(1,2,2);
stem(omega, X_FT_Phase);
xticks(omega);
xticklabels({'-9\pi','-7\pi','-5\pi','-3\pi','-\pi','\pi','3\pi','5\pi','7\pi','9\pi'});
xlabel('\omega');
ylabel('arg{X(j\omega)}');
title('Phase');
grid on;
