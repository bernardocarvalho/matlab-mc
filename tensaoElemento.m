function [ SIGMA ] = tensaoElemento( ele, Connect, nodeCoord, U,  EE, VV)
%sx, sy, sxy
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    tipo =Connect(ele,3);
    if(tipo ==4)
        iNd1 = Connect(ele,4);
        iNd2 = Connect(ele,5);
        iNd3 = Connect(ele,6);
        iNd4 = Connect(ele,7);
        Uele(1,1)= U(2*iNd1-1);
        Uele(2,1)= U(2*iNd1);
        Uele(3,1)= U(2*iNd2-1);
        Uele(4,1)= U(2*iNd2);
        Uele(5,1)= U(2*iNd3-1);
        Uele(6,1)= U(2*iNd3);
        Uele(7,1)= U(2*iNd4-1);
        Uele(8,1)= U(2*iNd4);
       
        x1=nodeCoord(iNd1,2);
        y1=nodeCoord(iNd1,3);
        x3=nodeCoord(iNd3,2);
        y3=nodeCoord(iNd3,3);
        a=x3-x1; b=y3-y1;
        CB  = CB_TP4(EE,VV,a,b);
        SIGMA=CB*Uele;
    end
    if(tipo ==3)
        iNd1 = Connect(ele,4);
        iNd2 = Connect(ele,5);
        iNd3 = Connect(ele,6);
        Uele(1,1)= U(2*iNd1-1);
        Uele(2,1)= U(2*iNd1);
        Uele(3,1)= U(2*iNd2-1);
        Uele(4,1)= U(2*iNd2);
        Uele(5,1)= U(2*iNd3-1);
        Uele(6,1)= U(2*iNd3);
       
        x2=nodeCoord(iNd2,2);
        y2=nodeCoord(iNd2,3);
        x3=nodeCoord(iNd3,2);
        y3=nodeCoord(iNd3,3);
        a=abs(x3-x2); b=abs(y3-y2);  
        CB  = CB_TP3(EE,VV,a,b);
        SIGMA=CB*Uele;
    end
    
end

