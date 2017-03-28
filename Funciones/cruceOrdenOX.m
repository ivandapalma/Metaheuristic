function [hijo1 hijo2] = cruceOrdenOX(padre, madre,tam)
    
        %padre=[7 3 1 8 2 4 6 5];
        %madre=[4 3 2 8 6 7 1 5];
        %tam=8;
        nBloques=3;
        hijo1=zeros(1,tam);
        hijo2=zeros(1,tam);

        % Genera un numero entre 1 y tam-(nBloques-1)
        I = randi(tam-nBloques+1);
        %display(I);



        % HIJO 1

        % Posiciones I, I+1, I+2... pasa del padre al hijo
        for i=I:(I+nBloques-1)
             hijo1(i)=padre(i);
        end 

        numeros = zeros(1,nBloques);
        for i=1:nBloques
            numeros(i)=padre(I+(i-1));
        end 
        % Eliminamos los escogidos del vector
        m=madre;
        for i=1:nBloques
            m(m==numeros(i))=[];    
        end 


        % El resto pasa de la madre al hijo1
        for i=1:(I-1)
            hijo1(i)=m(1);
            m(1)=[];
        end

        for i=I+nBloques:tam
            hijo1(i)=m(1);
            m(1)=[];
        end
        % NACIMIENTO DEL HIJO 1




        % HIJO 2

        % Posiciones I, I+1 e I+2 pasa del padre al hijo
        for i=I:(I+nBloques-1)
             hijo2(i)=madre(i);
        end 

        numeros = zeros(1,nBloques);

        for i=1:nBloques
            numeros(i)=madre(I+(i-1));
        end

        p=padre;
        for i=1:nBloques
            p(p==numeros(i))=[];    
        end 

         % El resto pasa del padre al hijo2
        for i=1:(I-1)
            hijo2(i)=p(1);
            p(1)=[];
        end

        for i=I+nBloques:tam
            hijo2(i)=p(1);
            p(1)=[];
        end

    % NACIMIENTO DEL HIJO 2
    
end