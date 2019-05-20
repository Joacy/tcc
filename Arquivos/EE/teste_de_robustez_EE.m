clear all

%Parâmetros do Sistema
Ms = 2.45;
Mus = 1;
Ks = linspace(900-(900*0.05), 900+(900*0.05), 7);
Kus = linspace(1250-(1250*0.05), 1250+(1250*0.05), 7);
Bs = linspace(6.75, 8.25, 7);
Bus = linspace(4.5, 5.5, 7);

%ganhos da matriz K
%K1 = -545.9043;
%K2 = 38.4895;
%K3 = 45.0246;
%K4 = -4.6480;

%ganhos quanser
K1 = 24.66;
K2 = 48.87;
K3 = -0.47;
K4 = 3.68;

% K1 = 0;
% K2 = 0;
% K3 = 0;
% K4 = 0;

for ks = 4:4
    for kus = 4:4
        for bs = 4:4
            for bus = 4:4
                    sim('sinal_de_controle_robustez')
                    %sim('robustez_EE')
                    plot(tout,yout,'b');
                    hold on
            end
        end
    end
end
% hold on
% t = 0:0.001:3/0.3;
% zr=0.01*square(2*pi*0.3*t)+0.01;
% plot(t,zr,'b')
grid on

%title('Respostas não Controladas do Sistema')
%title('Resposta Controlada do Sistema')
title('Sinal de Controle do Sistema')
xlabel('Tempo (s)')
ylabel('Amplitude (N)')
set (gca, 'FontName', 'times new roman')