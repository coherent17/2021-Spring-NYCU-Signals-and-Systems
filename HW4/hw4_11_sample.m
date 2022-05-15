clc;
clear;

%%% Original signal
n = -150:1:150;    
x = cos(7*pi*n/16) + cos(9*pi*n/16);

%%% Windowing 
M = [8 20 100];

%%%.............(Specify the window "h" in this line) 
h = zeros(size(x));
for i = 300/2-M(3)+1 : 300/2+M(3)+1
    h(i)=1;
end
y = x.*h;

%%% Angular frequency in DTFT

%%%..............(Write the code to specify Omega (the variable W in the following) here. Note that you need to analyze three different window sizes) 
W = -pi:0.01:pi;

X = DTFT(x, n, W);
H = DTFT(h, n, W);
Y = DTFT(y, n, W);
 
figure
subplot(3,2,1); plot(n, x); xlabel('n'); ylabel('x[n]');title('x');
subplot(3,2,2); plot(W, abs(X)); xlabel('\Omega'); ylabel('|X(e^{j\Omega})|'); title('DTFT{x}');
subplot(3,2,3); plot(n, h); xlabel('n'); ylabel('w[n]'); title('w');
subplot(3,2,4); plot(W, abs(H)); xlabel('\Omega'); ylabel('|W(e^{j\Omega})|'); title('DTFT{w}');
subplot(3,2,5); plot(n, y); xlabel('n'); ylabel('y[n]'); title('y');
subplot(3,2,6); plot(W, abs(Y)); xlabel('\Omega'); ylabel('|Y(e^{j\Omega})|'); title('DTFT{y}');


%%%% This is an example to do DTFT 
function X = DTFT(x, n, W)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% X = DTFT values computed at W  (1xNw)  
% x = Time sampled signal (1xNn)
% n = sample time vector  (1xNn) 
% W = frequency location vector  (1xNw)
% Nw: The length of W
% Nn: The length of n

X=x*exp(-1j*(n.'*W));
%X_tmp = exp(-1j*(W.' * n)) * x.';
%X = X_tmp.';

end
