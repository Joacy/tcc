%Sistema
Ms = 2.45;
Mus = 1;
Ks = linspace(900-(900*0.05), 900+(900*0.05), 7);
Kus = linspace(1250-(1250*0.05), 1250+(1250*0.05), 7);
Bs = linspace(6.75, 8.25, 7);
Bus = linspace(4.5, 5.5, 7);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 0:0.001:10;
zr=0.01*square(2*pi*0.3*t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = -4.8468;
B = 84.2503;
C = 2.4492e+04;
D = -45.0267;
E = 2.3865;
F = 101.6526;

controlador = tf([A B C D],[E F]);

% for ks = 1:7
%     for kus = 1:7
%         for bs = 1:7
%             for bus = 1:7
%                 ZsFc = tf([(Mus) (Bs(bs)) (Kus(kus))],[(Ms*Mus) (Ms*Bus(bus) + Bs(bs)*Mus + Ms*Bs(bs)) (Ms*Kus(kus) + Bs(bs)*Bus(bus) + Ks(ks)*Ms + Ks(ks)*Mus) (Ks(ks)*Bus(bus) + Bs(bs)*Kus(kus)) (Ks(ks)*Kus(kus))]);
%                 ZsZr = tf([(Bs(bs)*Bus(bus)) (Ks(ks)*Bus(bus) + Bs(bs)*Kus(kus)) (Ks(ks)*Kus(kus))],[(Ms*Mus) (Ms*Bus(bus) + Bs(bs)*Mus + Ms*Bs(bs)) (Ms*Kus(kus) + Bs(bs)*Bus(bus) + Ks(ks)*Ms + Ks(ks)*Mus) (Ks(ks)*Bus(bus) + Bs(bs)*Kus(kus)) (Ks(ks)*Kus(kus))]);
%                 Ts = ZsZr*feedback(1,(ZsFc*controlador));
%                 %Ts = ZsZr*feedback(1,(ZsFc));
%                 zs = lsim(Ts,zr,t);
%                 plot(t,zs,'black',t,zr,'b')
%                 hold on
%                 grid on
%             end
%         end
%     end
% end

for ks = 1:7
    for kus = 1:7
        for bs = 1:7
            for bus = 1:7
                ZsFc = tf([(Mus) (Bs(bs)) (Kus(kus))],[(Ms*Mus) (Ms*Bus(bus) + Bs(bs)*Mus + Ms*Bs(bs)) (Ms*Kus(kus) + Bs(bs)*Bus(bus) + Ks(ks)*Ms + Ks(ks)*Mus) (Ks(ks)*Bus(bus) + Bs(bs)*Kus(kus)) (Ks(ks)*Kus(kus))]);
                ZsZr = tf([(Bs(bs)*Bus(bus)) (Ks(ks)*Bus(bus) + Bs(bs)*Kus(kus)) (Ks(ks)*Kus(kus))],[(Ms*Mus) (Ms*Bus(bus) + Bs(bs)*Mus + Ms*Bs(bs)) (Ms*Kus(kus) + Bs(bs)*Bus(bus) + Ks(ks)*Ms + Ks(ks)*Mus) (Ks(ks)*Bus(bus) + Bs(bs)*Kus(kus)) (Ks(ks)*Kus(kus))]);
                Sc = (controlador*ZsZr)/(1 + controlador*ZsFc);
                sc = lsim(Sc,zr,t);
                plot(t,sc,'black')
                hold on
                grid on
            end
        end
    end
end