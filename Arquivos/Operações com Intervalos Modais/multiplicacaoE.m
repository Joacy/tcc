function [infC, supC] = multiplicacaoE(escalar, infA, supA)
    if escalar >= 0
        infC = escalar*infA;
		supC = escalar*supA;
    elseif escalar < 0
		infC = escalar*supA;
		supC = escalar*infA;
    end
end       