% ************************************************
%  Script pour g�n�rer des coefficients Cn
%  pour un filtre FIR bas� sur la s�rie de Fourier
% ************************************************
clc
clear
% ********Variables**********

% Fr�quence d'�chantillonage
fs = 3200;
% Fr�quence de coupure
fc = 50;
% Nombre de points (impair)
N = 15;

% ***************************

% Fr�quence de Nyquist
fn = fs / 2;
%Fr�quence de coupure normalis�e
v = fc / fn;
% Nombre de coefficients
Q = (N - 1) / 2;
% Calcul des coefficients pour filtre passe bas

C(1) = v; % 1er coefficient par la r�gle de l'Hopital
for n = 1:Q 
    C(n+1) = (sin(v * n * pi))/(n * pi); % Calcul des autres coefficients
end
% Inversion et concat�nation pour cr�er le sinus cardinal
H = horzcat(fliplr(C(2:Q+1)),C)
% Impression du sinus cardinal
plot(H,'b')
hold on
B = H .* transpose(blackman(N))
plot(B,'g')