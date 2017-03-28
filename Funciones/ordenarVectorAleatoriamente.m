function v = ordenarVectorAleatoriamente(vector)

    L=length(vector);
    v=vector;
    
    ordenNuevo =  randperm(L);
    %fprintf('\nOrden nuevo: %s\n',num2str(ordenNuevo));
       
    for k=1:L
        v(k) = vector(ordenNuevo(k));
    end
    
    %fprintf('\nVector inicial: %s\n',num2str(vector));
    %fprintf('Vector final: %s\n',num2str(v));
    
end