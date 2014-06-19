% ************************************************
%  Script pour générer des coefficients Cn
%  pour un filtre FIR basé sur la série de Fourier
% ************************************************
clc
clear
% ********Variables**********

% Fréquence d'échantillonage
fs = 3200;
% Fréquence de coupure
fc = 50;
% Nombre de points (impair)
N = 15;

% ***************************

% Fréquence de Nyquist
fn = fs / 2;
%Fréquence de coupure normalisée
v = fc / fn;
% Nombre de coefficients
Q = (N - 1) / 2;
% Calcul des coefficients pour filtre passe bas

C(1) = v; % 1er coefficient par la règle de l'Hopital
for n = 1:Q 
    C(n+1) = (sin(v * n * pi))/(n * pi); % Calcul des autres coefficients
end
% Inversion et concaténation pour créer le sinus cardinal
H = horzcat(fliplr(C(2:Q+1)),C)
% Impression du sinus cardinal
plot(H,'b')
hold on
B = H .* transpose(blackman(N))
plot(B,'g')