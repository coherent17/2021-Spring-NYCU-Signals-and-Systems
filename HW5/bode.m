clc;
clear;

%%% define the extent of angular frequency
w = 0.1:0.1:2000;  % angular frequency

s = 1j*w;  % s-domain

%%% The transfer funciton
H_a = 200./(s+1)./(s+10)./(s+100);
H_b = 400000.*(s+2)./(s+20)./(s.^2+s+40000);

%%% Magnitude (in dB) for H
abs_H_a = abs(H_a);
dB_H_a = 20*log10(abs_H_a);
abs_H_b = abs(H_b);
dB_H_b = 20*log10(abs_H_b);

%%% Phase (in degree) for H
pha_H_a = phase(H_a)*180/pi;
pha_H_b = phase(H_b)*180/pi;

figure
subplot(221)
semilogx(w,dB_H_a)
xlabel('Angular frequency')
ylabel('dB')
title('Magnitude of Frequency Response(a)')

subplot(222)
semilogx(w,pha_H_a)
xlabel('Angular frequency')
ylabel('Degree')
title('Phase of Frequency Response(a)')

subplot(223)
semilogx(w,dB_H_b)
xlabel('Angular frequency')
ylabel('dB')
title('Magnitude of Frequency Response(b)')

subplot(224)
semilogx(w,pha_H_b)
xlabel('Angular frequency')
ylabel('Degree')
title('Phase of Frequency Response(b)')