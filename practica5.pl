%% Ejercicios %%
 %1. Crea una base de conocimiento e implementa las relaciones de acuerdo a los siguientes eneunciados*/
    %a) Dos personas viven en la misma casa si tienen la misma direccion
    direccion(lisa,'Avenida siempre viva 742').
    direccion(bart,'Avenida siempre viva 742').
    direccion(dory,'P. Sherman Calle Wallaby 42, Sidney').
%Regla
    casa(X,Y):-(direccion(X,Z),direccion(Y,Z)).
    %b) Los que juegan basquetbol o futbol americano son deportistas
    personas(jordan,'basquetbol').
    personas(lebron,'basquetbol').
    personas(oliver,'soccer').
    personas(brady,'futbol americano').
    %regla
    deportista(X):-(personas(X,'futbol americano');personas(X,'basquetbol')).
    %c) Eres britanico si eres gales, ingles, escoces o irlandes
    nacionalidad(pedro,'mexicana').
    nacionalidad(sandra,'ingles').
    nacionalidad(charles,'Gales').
    nacionalidad(etni,'mexicana').
    nacionalidad(marco,'escoses').
    nacionalidad(daniel,'irlandes')
    %regla
    britanico(X):-(   nacionalidad(X,'Gales');nacionalidad(X,'escoses');nacionalidad(X,'ingles');nacionalidad(X,'irlandes')).
    %d) Te pueden multar si no has pagado la tenencia de tu automovil
    auto('LKS-870-A','pagado').
    auto('PVG-568-D','pagado').
    auto('ABC-123-F','adeudo').
    %regla
    multa(X):-(auto(X,'pagado')).
    
    %e) Una persona puede ser ciudadano mexicano si tiene la nacionalidad mexicana, es mayor edad y es honesto
    edad(etni,18).
    edad(pedro,30).
    edad(sandra,25).
    edad(charles,15).
    honest(pedro, 'F').
    honest(charles,'V').
    honest(etni, 'V')
    %regla
    ciudadano_mexa(X):-(   nacionalidad(X,'mexicana'),honest(X,'V'),edad(X,N), N >= 18).
  %2. Implementa una funcion que devuelva el maximo de una lista de numeros, todas las funciones auxiliares deben ser propias. Ademas, incluye como seria la ejecucion de la lista [1, 2, 3, 2, 1,]
  %
  
  %3. Implementa una funcion que devuelva la cantidad de numeros distintos que hay en una lista
% Caso base para una lista vacía.
contar_distintos([], 0).

% Predicado principal: Calculamos la cantidad de elementos distintos en Lista.
% Llamamos con un acumulador vacío y un contador.
contar_distintos(Lista, Cantidad) :-
    contar_unicos(Lista, [], 0, Cantidad). 

% Cuando la lista original está vacía, no hay elementos por contar y por ende no hay distintos.
contar_unicos([], _, Cantidad, Cantidad).

% Si el número no está en el acumulador, lo agregamos y aumentamos el contador.
% Dividimos la lista, tomamos la lista y el contador de los elementos únicos encontrados y la cantidad total de elementos únicos encontrados.
% Verificamos que el numero sea único (no esté en el acumulador), sino, lo agregamos e incrementamos el contador.
contar_unicos([Numero | Resto], Acumulador, ContadorNumerosUnicos, Cantidad) :-
    falta_en_lista(Numero, Acumulador),    
    NuevoContador is ContadorNumerosUnicos + 1,      
    contar_unicos(Resto, [Numero | Acumulador], NuevoContador, Cantidad).


% Si el número ya está en el acumulador (no es único), lo omitimos sin aumentar el contador.
% Llamamos recursivamente con el resto de la lista y los mismos acumulador y contador.
contar_unicos([Numero | Resto], Acumulador, ContadorNumerosUnicos, Cantidad) :-
    esta_en_lista(Numero, Acumulador), 
    contar_unicos(Resto, Acumulador, ContadorNumerosUnicos, Cantidad).

% Aux para verificar si no está en la lista.
% Caso base: El número no está en la lista.
falta_en_lista(_, []). 
% Caso recursivo: Si el número no coincide con el primer elemento de la lista, seguimos buscando en el resto.
falta_en_lista(Elemento, [Cabeza | Cola]) :-
    Elemento \= Cabeza,
    falta_en_lista(Elemento, Cola).

%Aux para verificar si está en la lista.
% Caso base: Si el primer elemento de la lista es igual al número buscado, devolvemos true.
esta_en_lista(Elemento, [Elemento | _]).
% Caso recursivo: Si no es el número buscado, seguimos buscando en el resto de la lista.
esta_en_lista(Elemento, [_ | Cola]) :-
    esta_en_lista(Elemento, Cola).


  
  %4. Implementa la funcion de Fibonacci. Incluye como seria la ejecucion de Fibonacci con 5.
