function [ FELE, KELE ] = buildKELE(Nelem,Connect,nodeCoord, EE, VV)
%3
% |\
% |  \
% |____\
% 1     2
%
%
% K is a cell array

% Vector de CARGAS
%F= tx*h*b/2
% divide-se por 2 pois a força esta dividida por dois nós
%os nós das pontas complemntam-se
    FELE= cell(1); % 
%FELE= cell(Nelem);
for ele=1:1:Nelem
    tipo =Connect(ele,3);
    if(tipo ==4)
        x1=nodeCoord(Connect(ele,4),2);
        y1=nodeCoord(Connect(ele,4),3);
        x3=nodeCoord(Connect(ele,6),2);
        y3=nodeCoord(Connect(ele,6),3);
        a=x3-x1; b=y3-y1;
        KELE{ele}= K_TP4(EE,VV,a,b); % precisa de abs() ? 

        %if %elemento estiver na condiçao fronteira
            %FELE(ele) = F_TP4 (tx, ty, b)  
        %end

        %if %elemento nao estiver na condiçao fronteira
            %FELE (ele) = [0; 0; 0 ; 0 ; 0 ; 0 ; 0 ; 0]
        %end
        %% atenção: multiplicar pela espessura

    end
    if(tipo ==3)
        x1=nodeCoord(Connect(ele,5),2);
        y1=nodeCoord(Connect(ele,5),3);
        x3=nodeCoord(Connect(ele,6),2);
        y3=nodeCoord(Connect(ele,6),3);
        a=abs(x3-x1); b=abs(y3-y1);  %verificar a Ordem
        KELE{ele}= K_TP3(EE,VV,a,b);
        %FELE(ele)=[0; 0; 0; 0 ; 0 ; 0] %??
        %atenção: falta triangulos em rotaçao

    end
end


