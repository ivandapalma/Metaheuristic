function [hijo1 hijo2] = crearHijosCHC(padre,madre,tam)
 
    daddy=padre;
    mommy=madre;
    hijo1=zeros(1,tam);
    hijo2=zeros(1,tam);
    
    % posiciones que son iguales en el padre y la madre
    posIguales=find(daddy==mommy);
    
    for i=1:length(posIguales)
       hijo1(posIguales(i))=daddy(posIguales(i));
       hijo2(posIguales(i))=daddy(posIguales(i));
    end
    
    % vector con los elementos distintos entre el padre y la madre
    vDistintas=daddy(daddy~=mommy);
    
    posiciones1=ordenarVectorAleatoriamente(vDistintas);
    posiciones2=ordenarVectorAleatoriamente(vDistintas);
    
    for i=1:tam
        if(hijo1(i)==0) % también valdría con hijo2 ya que son iguales
            hijo1(i)=posiciones1(1);
            posiciones1(1)=[]; % Vamos quitando cuando lo metemos
            hijo2(i)=posiciones2(1);
            posiciones2(1)=[]; % Vamos quitando cuando lo metemos
        end
    end

end