% plot(X1,Y1,S1,X2,Y2,S2,X3,Y3,S3,...) combines the plots defined by
%   the (X,Y,S) triples, where the X's and Y's are vectors or matrices 
%   and the S's are strings.  
%
figure(2)
elmtIdx=[ 1:9 11:15 17:26]; % Excluir os no 10 e 16
%X4, X3, Y3, Y4;
%hold on
subplot(2,1,1)
hold off

X= nodeCoord(1,2);
Y= nodeCoord(1,3);
plot (X,Y,'b*-');
hold on
subplot(2,1,2)
hold off

plot (X,Y,'b*-');
hold on
 
for i= 1:1:length(elmtIdx)
    elem = elmtIdx(i);
    tipo =Connect(elem,3);
    if(tipo ==4)
        for i=1:4
             no = Connect(elem,3+i);
             X(1,i)= nodeCoord(no,2);
             Y(1,i)= nodeCoord(no,3);
        end
        sigma = tensaoElemento(elem, Connect, nodeCoord, U,  EE, VV);
        subplot(2,1,1)
        color=sigma(1);
        patch(X,Y,color)
        hold on
        subplot(2,1,2)
        color=sigma(2);
        patch(X,Y,color)
        hold on
               
    end
    
    if(tipo ==3)
        X=[];Y=[]; % Apagar vetores
        for i=1:3
             no = Connect(elem,3+i);
             X(i)= nodeCoord(no,2);
             Y(i)= nodeCoord(no,3);
        end
        sigma = tensaoElemento(elem, Connect, nodeCoord, U,  EE, VV);
        subplot(2,1,1)

        color=sigma(1);

        patch(X,Y,color)
        hold on
        subplot(2,1,2)
        color=sigma(2);
        patch(X,Y,color)
        hold on       
    end
    vonMises=sqrt((sigma(1) - sigma(2))^2 + sigma(1)^2+ sigma(2)^2 );

    fprintf(1,'Elemento: %d, Tensao de von Mises: %14.7e\n',elem, vonMises);

    
end
subplot(2,1,1)
title 'Tensao X'
colorbar
subplot(2,1,2)
title 'Tensao  Y'
colorbar


