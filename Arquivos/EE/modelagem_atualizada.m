%Parâmetros do Sistema
Ms = 2.45;
Mus = 1;
Ks = 900;
Kus = 1250;
Bs = 7.5;
Bus = 5;

%Modelagem Espaço de Estados
A = [1 0 0 0; -Ks/Ms -Bs/Ms Ks/Ms Bs/Ms; 0 0 1 0; Ks/Mus Bs/Mus -(Kus+Ks)/Mus -(Bus+Bs)/Mus];
B = [0 0; 0 1/Ms; 0 0; Kus/Mus -1/Mus];
C = [1 0 0 0; 0 0 1 0];
D = [0 0; 0 0];

sistema = ss(A, B, C, D);