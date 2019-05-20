clear all
%Alocacao de Polos para Espaco de Estados
A = [0 1 0 -1;-367.346938775510 -3.06122448979592 0 3.06122448979592;0 0 0 1;900 7.5 -1250 -12.5];
B = [0;0.408163265306122;0;-1];

%Busca de polos dominantes considerando 10% de sobrelevação máxima
%e tempo de estabelecimento de 0,5 segundos
mp = 0.05;
ts = 0.5;

%Busca de polos dominantes considerando 5% de sobrelevação máxima
%e tempo de estabelecimento de 0,5 segundos
mp2 = 0.01;

lmp = log(mp);
qsi = sqrt((lmp^2)/(pi^2+lmp^2));
wn = 4/(qsi*ts); %Critério de 5%

lmp2 = log(mp2);
qsi2 = sqrt((lmp2^2)/(pi^2+lmp2^2));
wn2 = 4/(qsi2*ts); %Critério de 5%

dominantes = roots([1 2*qsi*wn wn^2]);
polosDesejados = [-120;-100;dominantes(1);dominantes(2)];

dominantes2 = roots([1 2*qsi2*wn2 wn2^2]);
%polosDesejados2 = [-9.9596+46.0265*(2.3/3)*1i;-9.9596-46.0265*(2.3/3)*1i;dominantes2(1);dominantes2(2)];

ganhos = acker(A,B,polosDesejados);
%ganhos2 = place(A,B,polosDesejados2);

p = eig(A-B*ganhos);
%p2 = eig(A-B*ganhos2);

display(ganhos);
display(p);

%display(ganhos2);
%display(p2);

%ganhos -792.3922   18.6069  122.3028   -8.7633