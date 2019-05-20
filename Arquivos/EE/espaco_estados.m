%Entrada (Perturbação)
t = 0:0.001:10;
zr=0.01*square(2*pi*0.3*t);

%Parâmetros do Sistema
Ms = 2.45;
Mus = 1;
Ks = 900;
Kus = 1250;
Bs = 7.5;
Bus = 5;

%Representação no Espaço de Estados
A = [0 1 0 -1; -Ks/Ms -Bs/Ms 0 Bs/Ms; 0 0 0 1; Ks/Mus Bs/Mus -Kus/Mus -(Bs+Bus)/Mus];
B = [0 0; 0 1/Ms; -1 0; Bus/Mus -1/Mus];
C = [1 0 0 0; -Ks/Ms -Bs/Ms 0 Bs/Ms];
D = [0 0; 0 1/Ms];

sistema = ss(A, B, C, D);