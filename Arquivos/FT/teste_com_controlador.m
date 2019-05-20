% Aloca��o de P�los
% P�los em:
s = -250;
s1 = -120;
s2 = -7.1719 +47.5981*2/3i;
s3 = -7.1719 -47.5981*2/3i;
s4 = -3.6;

a = conv([1 -s],[1 -s1]);
b = conv([1 -s2],[1 -s3]);
c = conv(a,b);
d = conv(c,[1 -s4]);

%C�lculo dos Coeficientes
X = [1 0 0 0 2.45 0; 7.5 1 0 0 38.13 2.45; 1250 7.5 1 0 6205 38.13; 0 1250 7.5 1 13875 6205; 0 0 1250 7.5 1.125e06 13875; 0 0 0 1250 0 1.125e06];
Y = [d(1); d(2); d(3); d(4); d(5); d(6)];
Coeficientes = X\Y;

%Equa��o do Controlador
A = Coeficientes(1);
B = Coeficientes(2);
C = Coeficientes(3);
D = Coeficientes(4);
E = Coeficientes(5);
F = Coeficientes(6);

Gcs = tf([A B C D],[E F]);

%Resposta Malha Fechada com Controlador

%Entrada (Perturba��o)
t = 0:0.001:10;
zr=0.01*square(2*pi*0.3*t);

%Sistema
Ms = 2.45;
Mus = 1;
Ks = 900;
Kus = 1250;
Bs = 7.5;
Bus = 5;
ZsFc = tf([(Mus) (Bs) (Kus)],[(Ms*Mus) (Ms*Bus + Bs*Mus + Ms*Bs) (Ms*Kus + Bs*Bus + Ks*Ms + Ks*Mus) (Ks*Bus + Bs*Kus) (Ks*Kus)]);
ZsZr = tf([(Bs*Bus) (Ks*Bus + Bs*Kus) (Ks*Kus)],[(Ms*Mus) (Ms*Bus + Bs*Mus + Ms*Bs) (Ms*Kus + Bs*Bus + Ks*Ms + Ks*Mus) (Ks*Bus + Bs*Kus) (Ks*Kus)]);

%Equa��o de malha Fechada

Ts = ZsZr*feedback(1,(ZsFc*Gcs));
%Resposta do Sistema Controlado
figure
zs = lsim(Ts,zr,t);
plot(t,zs,t,zr)
grid on
%title('Resposta do Sistema Controlado')

%Sinal de Controle do Sistema
Sc = (Gcs*ZsZr)/(1 + Gcs*ZsFc);

figure
sc = lsim(Sc,zr,t);
plot(t,sc)
grid on