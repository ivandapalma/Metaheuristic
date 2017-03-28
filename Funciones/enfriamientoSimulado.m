function [solucion coste] = enfriamientoSimulado(mDistancias, mFlujo,tam)
    
    % Se han de implementar dos variantes del algoritmo ES con las siguientes componentes:
    % Esquema de enfriamiento: esquema de Cauchy: Tk = T0/(1 + k)

    % Condici�n de enfriamiento L(T): Se enfriar� la temperatura, y finalizar� a la
    % iteraci�n actual, cuando se haya generado un n�mero m�ximo de
    % vecinos. L(T) = 20
        
    % Condici�n de parada: El algoritmo finalizar� cuando se alcance un n�mero
    % m�ximo de iteraciones (enfriamientos):  ser� 80*tam
    % Se calcular� la temperatura inicial en funci�n de la siguiente f�rmula:

    solInicial = zeros(1,tam);
    for d=1:tam %Rellena con 1,2,3...tam
		solInicial(d)=d;
    end
    
    solInicial = solInicial(randperm(numel(solInicial))); % Ordena aleatoriamente el vector
	solActual = solInicial;
    costeaux = getCoste(solInicial,mDistancias,mFlujo,tam);
    t0 = (0.3/-log(0.3))*costeaux;
    T=t0;
    LT=20;
    solActual = solInicial;
    fprintf('\nCOMIENZO');
    for i=1:200 %(80*tam)    
        for cont=1:LT
            candidato = generaMejorVecino(solActual,mDistancias,mFlujo,tam);
            c=getCoste(candidato,mDistancias,mFlujo,tam);
            a=getCoste(solActual,mDistancias,mFlujo,tam);   %Coste Candidata - Coste Actual
            delta=c-a;
            %prob = rand();
            Pacept=exp(-delta/T);
            if ((delta < 0) || (rand() < Pacept))
               solActual = candidato;
            end
            
            %fprintf('%d %d cand: %d act: %d T: %d delta: %d\n',i,cont,c,a,T,delta);
        end 
        T = t0/(1+cont); % Esquema de Cauchy
    end
    fprintf('\nCOMPLETADO');
    solucion=solActual;
    coste=getCoste(solActual,mDistancias,mFlujo,tam);
    fprintf('\nSolucion: %s\nCoste: %d',num2str(solucion),coste);
    
end