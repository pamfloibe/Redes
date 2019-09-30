stationA = 0;
stationB = 0;
numTransmisionesA = 0;
numTransmisionesB = 0;
totalTransmisiones = 0;
totalIntentos = 0;
x=0;

numColisiones = 0;
tiempo = .05; %50 ms
pTransmision = 0.5; %transmision exitosa

while numColisiones < 50 %Minimo # de colisiones
    totalIntentos = totalIntentos + 1; %# de intentos de transmision
    
    x=rand; %probabilidad de que transmita A
    if(x <= pTransmision) %Si es menor, se manda
        stationA = 1; %se transmite A
        numTransmisionesA = numTransmisionesA + 1;
    else 
        stationA = 0; %no se transmite A
    end
    
    
    x=rand; %probabilidad de que transmita B
     if(x <= pTransmision) %Si es menor, se manda
        stationB = 1; %se transmite B
        numTransmisionesB = numTransmisionesB + 1;
     else 
        stationB = 0; %no se transmite B
     end
     
     
     %Revisar numero de transmisiones
     if(stationA == 1 || stationB == 1)
         totalTransmisiones = totalTransmisiones + 1;
     end
     
     %Revisar si hay colisiones
     if(stationA == 1 && stationB == 1)
        numColisiones = numColisiones + 1;
     end
    
end

tiempoTransmision = totalIntentos*tiempo;