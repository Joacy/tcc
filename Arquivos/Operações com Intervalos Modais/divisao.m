function [infC, supC] = divisao(infA, supA, infB, supB)
    if infA >= 0
        if supA >= 0
            if infB > 0
                if supB > 0
                    infC = infA/supB;
                    supC = supA/infB;
                end
            elseif infB < 0
                if supB < 0
                    infC = supA/supB;
                    supC = infA/infB;
                end
            end
        elseif supA < 0
            if infB > 0
                if supB > 0
                    infC = infA/supB;
                    supC = supA/supB;
                end
            elseif infB < 0
                if supB < 0
                    infC = supA/infB;
                    supC = infA/infB;
                end
            end
        end
    elseif infA < 0
        if supA >= 0
            if infB > 0
                if supB > 0
                    infC = infA/infB;
                    supC = supA/infB;
                end
            elseif infB < 0
                if supB < 0
                    infC = supA/supB;
                    supC = infA/supB;
                end
            end
        elseif supA < 0
            if infB > 0
                if supB > 0
                    infC = infA/infB;
                    supC = supA/supB;
                end
            elseif infB < 0
                if supB < 0
                    infC = supA/infB;
                    supC = infA/supB;
                end
            end
        end
    end
end