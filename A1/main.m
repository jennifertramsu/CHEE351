% Jennifer Tram Su
% Assignment 1 Code

clear
clc

%% Question 1a
z1 = 0.6;
f = 0.36;
F = 100; % kmol/h
p = 1; % atm

% Flow Rates
V = f*F;
L = F - V;

% Compositions
r = @(T) 1 - z1 / (1 + f*(antoine(T, 'm') - 1)) - (1 - z1) / (1 + f*(antoine(T, 'w') - 1));
t = fsolve(r, 100); % temperature in deg C

k1 = antoine(t, 'm');

x1 = z1 / (1 + f*(k1 - 1));
y1 = k1 * x1;

%% Question 1b
z1 = 0.2;
x1 = 0.09;
F = 1000; % kmol/h

% Composition
r = @(T) 1 - antoine(T, 'm') * x1 - antoine(T, 'w') * (1 - x1);
t = fsolve(r, 100);

k1 = antoine(t, 'm');
y1 = k1 * x1;

% V/F (= f)
r2 = @(f) x1 - z1 / (1 + f*(k1 - 1));
f = fsolve(r2, 1);

% Product flow rates
V = f*F;
L = F - V;

%% Question 1c
x1 = 0.5;
L = 600; % kmol/h
f = 0.25;

% Feed flow rate
F = L / (1 - f);
V = f*F;
L = F - L;

% Feed composition
r = @(T) 1 - (f*antoine(T, 'm')*x1 + (1 - f) * x1) - (f*antoine(T, 'w')*(1 - x1) + (1 - f) * (1 - x1));
t = fsolve(r, 100);

z1 = f*antoine(t, 'm')*x1 + (1 - f) * x1;
z2 = 1 - z1;

%% Question 1d
y1 = 0.7;

% Tdrum
r = @(T) 1 - y1 / antoine(T, 'm') - (1 - y1) / antoine(T, 'w');
t = fsolve(r, 100); % Tdrum

k1 = antoine(t, 'm');

% Compositions
% --> at V/F = 1
z1 = y1;

% --> at V/F  = 0
z1 = y1 / k1;
