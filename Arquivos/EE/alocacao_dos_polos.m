clear all
%Alocacao de Polos para Espaco de Estados
A = [0 1 0 -1;-367.346938775510 -3.06122448979592 0 3.06122448979592;0 0 0 1;900 7.50000000000000 -1250 -12.5000000000000];
%B = [0 0;0 0.408163265306122;-1 0;5 -1];
B = [0;0.408163265306122;0;-1];
%K = [24.66 48.87 -0.47 3.68;0 0 0 0];
K = [24.66 48.87 -0.47 3.68];

%Polos antes dos ganhos
polos = eig(A);

%Polos depois dos ganhos
polos2 = eig(A-B*K);
display(polos2);

K1=place(A,B,polos2);