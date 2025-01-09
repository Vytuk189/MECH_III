
clear all
close all

% Values
m1=43;
m2=19;
l1=0.7;
l2=0.3;
l3=0.5;
EJ1=8500;
EJ2=7500;
F20=6800;
k=35000;
omega0=63;
y1t0=0.004;
y2t0=-0.003;
v1t0=0.6;
v2t0=-0.5;

alpha11 = l2^2*(l1+l2)/(3*EJ1);
alpha22 = l3^3/(3*EJ2);

k1=1/alpha11;
k2=1/alpha22;
                  
% Poc. podm.
y0=[y1t0;
    y2t0];
y0dot=[v1t0;
       v2t0];

% Matice
M=[m1  0;
    0 m2];

K=[ k+k1   -k;
   -k       k+k2];

f0=[0;
    F20];

% HOMOGEN.
% Vlastni cisla a vektory
[u,v]=eig(K,M);
omega1=sqrt(v(1,1));
omega2=sqrt(v(2,2));
u1norm=u(:,1)/u(1,1);
u2norm=u(:,2)/u(1,2);






% PARTIKULAR.

R=inv(K-omega0^2*M)*f0

% Amplituda = f(omega)
y=[];   
omega=0:0.1:200;
for i=1:1:length(omega)
    y=[y, inv(K-omega(i)^2*M)*f0];
end

% Plot
figure
plot(omega, y(1,:),'b.',omega, y(2,:),'r.')
axis([0 200 -1 1])   
grid on
title('Rezonanční křivky')
xlabel('omega [1/s]'), ylabel('Výchylky [m]')
legend('y1','y2')


% CELKOVE

A=inv(u)*y0;
B=inv(u*sqrt(v))*(y0dot-R*omega);

t=0:0.0001:6*pi/omega1;

y1=A(1)*u(1,1)*cos(omega1*t)+B(1)*u(1,1)*sin(omega1*t)+A(2)*u(1,2)*cos(omega2*t)+B(2)*u(1,2)*sin(omega2*t)+R(1)*cos(omega0*t);
y2=A(1)*u(2,1)*cos(omega1*t)+B(1)*u(2,1)*sin(omega1*t)+A(2)*u(2,2)*cos(omega2*t)+B(2)*u(2,2)*sin(omega2*t)+R(2)*cos(omega0*t);

% Plot
figure 
plot(t,y1,'b',t,y2,'r') 
title('Průběh')
xlabel('Čas [s]'), ylabel('Výchylka [m]')
legend('y1(t)','y2(t)')
