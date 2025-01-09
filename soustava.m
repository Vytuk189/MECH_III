function xprime = soustava(t, u)
    % Globální proměnné
    global m2 m3 I4 I2 m5 k r2 R2 r4;
    
    % Stavové proměnné
    x = u(1);      % Poloha x [m]
    v = u(2);    % Rychlost [m/s]
    
    % M*
    M = m5 + I4/r4^2 + I2/(R2+r2)^2 + (m2+m3)*(R2/(r2+R2))^2;
    
    % Diferenciální rovnice
    x_dotdot = (-k*x + 9.81*(m2+m3)*R2/(r2+R2) ) / M;
    
    % Výstupní vektor (rychlost, zrychlení)
    xprime = [v; x_dotdot];
end
