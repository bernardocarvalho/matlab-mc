% plot(X1,Y1,S1,X2,Y2,S2,X3,Y3,S3,...) combines the plots defined by
%   the (X,Y,S) triples, where the X's and Y's are vectors or matrices 
%   and the S's are strings.  
%

%X4, X3, Y3, Y4;
hold on
for elem= 1:1:Nelem
    tipo =Connect(elem,3);
    if(tipo ==4)
        for i=1:4
             no = Connect(elem,3+i);
             X(i)= nodeCoord(no,2);
             Y(i)= nodeCoord(no,3);
        end
        X(5)=X(1);Y(5)=Y(1);
        plot (X,Y,'b*-');
    end
     %plot(nodeCoord(no1,2:3),nodeCoord(no2,2:3),nodeCoord(no3,2:3),nodeCoord(no4,2:3))
    % plot(nodeCoord(no1,2),nodeCoord(no2,2),nodeCoord(no3,2),nodeCoord(no4,2))
    % plot(nodeCoord(no1,3),nodeCoord(no2,3),nodeCoord(no3,3),nodeCoord(no4,3))

    if(tipo ==3)
        X=[];Y=[]; % clear arrays
        for i=1:3
             no = Connect(elem,3+i);
             X(i)= nodeCoord(no,2);
             Y(i)= nodeCoord(no,3);
        end
        X(4)=X(1);Y(4)=Y(1);
        plot (X,Y,'r*-');

    % plot(nodeCoord(no1,2:3),nodeCoord(no2,2:3),nodeCoord(no3,2:3))

    end
end


