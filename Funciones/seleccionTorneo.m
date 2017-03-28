function [mejor tercerMejor] = seleccionTorneo(mDistancias, mFlujo,poblacion,tam)

    aleatorios=zeros(1,5);

    % Generamos 5 numeros aleatorios entre 1 y 25
    for i=1:5
        aleatorios(i) = randi(25);
    end
    
    escogidos=zeros(5,tam);
    
    for j=1:5
        escogidos(j,:) = poblacion(aleatorios(j),:);
    end
    
    % ordenamos por coste los escogidos y cogemos el mejor
    % y el tercer
    
    % Vamos viendo si va bien
    % fprintf('Aleatorios: %s',num2str(aleatorios));
    % fprintf('\n\n');
    % for i=1:5
    %      fprintf('%s %d\n',num2str(escogidos(i,:)),getCoste(escogidos(i,:),mDistancias,mFlujo,tam))
    % end
     
     e = ordSeleccion(mDistancias, mFlujo,escogidos,5,tam);
     
    %  fprintf('\n\n');
    %  for i=1:5
    %      fprintf('%s %d\n',num2str(e(i,:)),getCoste(e(i,:),mDistancias,mFlujo,tam))
    %  end
     
     mejor = e(1,:);
     tercerMejor = e(3,:);
     
    % Si el coste es igual es muy probable
    % que se haya escogido el mismo en los dos
    % [mejor costeMejor] = getMejor(escogidos);
    % costeOtroMejor = costeMejor;
    % while(costeMejor == costeOtroMejor)         
        % El otro al azar entre los escogidos
    %     a = randi(5);
    %     otroMejor = escogidos(a);
    %     costeOtroMejor = getCoste(otroMejor,mDistancias,mFlujo,tam);
    % end

     
end

