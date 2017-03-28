function vectorMutado = mutar(vectorAMutar)
 
  num1=0;
  num2=0;
  while(num1==num2)
      num1 = randi(25);
      num2 = randi(25);
  end
  %fprintf('Mutacion --> %d %d\n',num1,num2);
  % Generamos dos numeros aleatorios entre 1 y tam
  vectorMutado = intercambiar(vectorAMutar,num1,num2);
  
end

