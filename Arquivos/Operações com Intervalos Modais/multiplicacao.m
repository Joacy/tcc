function [infC, supC] = multiplicacao(infA, supA, infB, supB)
    if infA >= 0
        if supA >= 0
            if infB >= 0
                if supB >= 0
                    infC = infA*infB;
                    supC = supA*supB;
                elseif supB < 0
                    infC = infA*infB;
                    supC = infA*supB;
                end
            elseif infB < 0
                if supB >= 0
                    infC = supA*infB;
                    supC = supA*supB;
                elseif supB < 0
                    infC = supA*infB;
                    supC = infA*supB;
                end
            end
        elseif supA < 0
            if infB >= 0
                if supB >= 0
                    infC = infA*infB;
                    supC = supA*infB;
                elseif supB < 0
                    if infA*infB >= supA*supB
                        infC = infA*infB;
                    elseif supA*supB >= infA*infB
                        infC = supA*supB;
                    end
                    if supA*infB <= infA*supB
                        supC = supA*infB;
                    elseif infA*supB <= supA*infB
                        supC = infA*supB;
                    end
                end
            elseif infB < 0
                if supB >= 0
                    infC = 0;
                    supC = 0;
                elseif supB < 0
                    infC = supA*supB;
                    supC = infA*supB;
                end
            end
        end
    elseif infA < 0
        if supA >= 0
            if infB >= 0
                if supB >= 0
                    infC = infA*supB;
                    supC = supA*supB;
                elseif supB < 0
                    infC = 0;
                    supC = 0;
                end
            elseif infB < 0
                if supB >= 0
                    if supA*infB <= infA*supB
                        infC = supA*infB;
                    elseif infA*supB <= supA*infB
                        infC = infA*supB;
                    end
                    if infA*infB >= supA*supB
                        supC = infA*infB;
                    elseif supA*supB >= infA*infB
                        supC = supA*supB;
                    end
                elseif supB < 0
                    infC = supA*infB;
                    supC = infA*infB;
                end
            end
        elseif supA < 0
            if infB >= 0
                if supB >= 0
                    infC = infA*supB;
                    supC = supA*infB;
                elseif supB < 0
                    infC = supA*supB;
                    supC = supA*infB;
                end
            elseif infB < 0
                if supB >= 0
                    infC = infA*supB;
                    supC = infA*infB;
                elseif supB < 0
                    infC = supA*supB;
                    supC = infA*infB;
                end
            end
        end
    end
end