% plot(X1,Y1,S1,X2,Y2,S2,X3,Y3,S3,...) combines the plots defined by
%   the (X,Y,S) triples, where the X's and Y's are vectors or matrices 
%   and the S's are strings.  
%
figure (1)
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
 
for elem= 1:1:Nelem
    tipo =Connect(elem,3);
     X=[];Y=[];DX=[];DY=[]; % Apagar vetores
    if(tipo ==4)
        for i=1:4
             no = Connect(elem,3+i);
             X(i)= nodeCoord(no,2);
             Y(i)= nodeCoord(no,3);
             DX(i)= nodeCoord(no,2)+Ux(no);
             DY(i)= nodeCoord(no,3)+Uy(no);
        end
        subplot(2,1,1)
        quiver(X,Y,DX,DY, 'k')
        X(5)=X(1);Y(5)=Y(1);
        DX(5)=DX(1);DY(5)=DY(1);
        
        plot (X,Y,'b*-');
        title 'Placa Original'
       %hold on
        subplot(2,1,2)
        plot(DX,DY,'b*-')
        title 'Placa Deformada'
       
    end
    
    if(tipo ==3)
       
        for i=1:3
             no = Connect(elem,3+i);
             X(i)= nodeCoord(no,2);
             Y(i)= nodeCoord(no,3);
             DX(i)= nodeCoord(no,2)+ Ux(no);
             DY(i)= nodeCoord(no,3) + Uy(no);
        end      
        subplot(2,1,1,'k')
        quiver(X,Y,DX,DY)
        X(4)=X(1);Y(4)=Y(1);
        DX(4)=DX(1);DY(4)=DY(1);
    
        plot (X,Y,'r*-');
        %hold on
         subplot(2,1,2)
        plot(DX,DY,'r*-')

    end
end


