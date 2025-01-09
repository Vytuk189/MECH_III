% Mechanika III - Pohybová rovnice soustavy dle zadání
clear all; close all; format compact; format long;

% Globální proměnné
global m2 m3 I4 I2 m5 k r2 R2 r4;

% Parametry systému podle zadání
m2 = 10;    % [kg]
m3 = 50;    % [kg]
m5 = 20; % [kg]
I2 = 0.2; % [kg*m^2]
I4 = 0.06;    % [kg*m^2]
r2 = 0.15;  % [m]
R2 = 0.3;    % [m]
r4 = 0.2;    % [m]
k = 4500;    % [N/m]

% Počáteční podmínky
x0 = 0.0;  % [m]
v0 = 0.0; % [m/s]

% Čas simulace
t0 = 0;    % [s]
tend = 2;  % [s]

% Počáteční stav
X0 = [x0; v0];

% Numerická integrace pomocí ode45
options = odeset('reltol', 1e-12, 'abstol', 1e-12);
[t, X] = ode45(@soustava, [t0 tend], X0, options);

% Výsledky
x = X(:,1);   % X [m]
v = X(:,2); % Rychlost[m/s]

% Zobrazení výsledků
figure(1)
plot(t, x);
xlabel('Čas [s]');
ylabel('Poloha x [m]');
title('Závislost x(t)');
grid on;

figure(2)
plot(t, v);
xlabel('Čas [s]');
ylabel('Rychlost v [m/s]');
title('Závislost v(t)');
grid on;
