function [mejor costeMejor] = getMejor(elites)

    mejor = elites(1);
    costeMejor = getCoste(elites(1,:),mDistancias,mFlujo,tam);
    costeCandidato=0;
    
    for i=2:5
        costeCandidato = getCoste(elites(i),mDistancias,mFlujo,tam);
        if(costeCandidato < costeMejor)
            mejor = elites(i);
            costeMejor = costeCandidato;
        end
    end
    
end

