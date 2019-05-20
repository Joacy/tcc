%Parâmetros do Sistema
Ms = 2.45;
Mus = 1;
Ks = 900;
Kus = 1250;
Bs = 7.5;
Bus = 5;

%Representação no Espaço de Estados
A = [0, 1, 0, -1; -Ks/Ms, -Bs/Ms, 0, Bs/Ms; 0, 0, 0, 1; Ks/Mus, Bs/Mus, -Kus/Mus, -(Bs+Bus)/Mus];
B = [0, 0; 0 1/Ms; -1 0; Bus/Mus, -1/Mus];
C = [1, 0, 0, 0; -Ks/Ms, -Bs/Ms, 0, Bs/Ms];
D = [0, 0; 0, 1/Ms];

sistema = ss(A, B, C, D);

%Transformação em Função de Transferência
[num,den] = ss2tf(A,B,C,D,1);
[num1,den] = ss2tf(A,B,C,D,2);

%L{(zs-zus)/zr'}
tf1=tf([num(1) num(2) num(3) num(4) num(5)],den);
%L{(zs-zus)/Fc}
tf2=tf([num(6) num(7) num(8) num(9) num(10)],den);
%L{zs''/zr'}
tf3=tf([num1(1) num1(2) num1(3) num1(4) num1(5)],den);
tf3=series(tf3,tf([0 1 0],[1 0 0]));
%L{zs''/Fc}
tf4=tf([num1(6) num1(7) num1(8) num1(9) num1(10)],den);
tf4=series(tf4,tf([0 0 1],[1 0 0]));