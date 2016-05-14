function [ K] = buildK(Nnodes, Nelem, Connect, KELE)
%
%
    K   = sparse(Nnodes*2, Nnodes*2);
%    F   = sparse(Nnodes*2, 1);
    % Global matrices construction: (assemblage of K and F without BCs)
    for ele=1:1:Nelem
            NiNd=Connect(ele,3);
            for iNd1=1:1:NiNd
                nd1=Connect(ele, 3 + iNd1);
%0      function [ K ] = fillSubK(K, ele, gNdRow, gNdCol, iNdRow, iNdCol, KELE)
                
                K  = fillSubK(K, ele, nd1, nd1, iNd1, iNd1, KELE);    % fill diagonal element
                for iNd2=(iNd1+1):1:NiNd
                    nd2=Connect(ele, 3 + iNd2);
                    K  = fillSubK(K, ele, nd1, nd2, iNd1, iNd2, KELE); % fill non diagonal element
                    K  = fillSubK(K, ele, nd2, nd1, iNd1, iNd2, KELE); % Matrix is symetric 
                end
            end 
     end
end
    %Matriz de Conecçso reduzida, so com Nós 
    %gNdRow= global node ''linha''
%            iNdRow=iNds(ele) ; %1º nó interno do 
%            fprintf('gR %d E %d iNdRow %d \n', gNdRow, ele,  iNdRow);
%            for gNdCol=1:1:5% Nnodes % %correr as colunas da matriz K
%    ConnRes=Connect(:,4:7); % 
%    for gNdRow=1:1:5 %Nnodes  %correr as linhas da matriz K
%        [elmts,iNds] = find(ConnRes==gNdRow);
%        for ele=1:1:length(elmts)%correr os elementos selcionados
%            iNdRow=iNds(ele) ; %1º nó interno do 
%            fprintf('gR %d E %d iNdRow %d \n', gNdRow, ele,  iNdRow);
%            for gNdCol=1:1:5% Nnodes % %correr as colunas da matriz K%
%
%                [e,iNd] = find(ConnRes(ele,:)==gNdCol); % Procura os nós no elemento, encontra só um
%                fprintf('R %d C %d, i %d; ', gNdRow, gNdCol, iNd);
%                if (length(iNd)==1)
%                    iNdCol=iNd;
%                    %rangeK=[(2*gNdRow-1):(2*gNdRow); (2*gNdCol-1):(2*gNdCol)]
%                    Krows = (2*gNdRow-1):(2*gNdRow); 
%                    Kcols = (2*gNdCol-1):(2*gNdCol);
%                    K(Krows, Kcols) = K(Krows, Kcols) +  KELE{ele}((2*iNdRow-1):(2*iNdRow),(2*iNdCol-1):(2*iNdCol)) ;     % Add entries at KGlobal
%                end
%                fprintf('\n');
%            end
%        end
%    end
%    %F(edof) = F(edof) + Fe;                 % Add entries at FGlobal
%end
%    if Nnodes<=7
%    full(K)
%    tecla=input('enter to continue -->');
%   end
