function [ K ] = fillSubK(K, ele, gNdRow, gNdCol, iNdRow, iNdCol, KELE)
%
    Krows = (2*gNdRow-1):(2*gNdRow); 
    Kcols = (2*gNdCol-1):(2*gNdCol);
    K(Krows, Kcols) = K(Krows, Kcols) +  KELE{ele}((2*iNdRow-1):(2*iNdRow),(2*iNdCol-1):(2*iNdCol)) ;     % Add entries at KGlobal
end

