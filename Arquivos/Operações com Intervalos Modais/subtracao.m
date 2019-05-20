function [infC, supC] = subtracao(infA, supA, infB, supB)
    infC = infA - supB;
    supC = supA - infB;
end