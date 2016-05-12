function [ K] = buildK(Nnodes, Connect, KELE)
%
%
    K   = sparse(Nnodes*2,Nnodes*2);
    F   = sparse(Nnodes*2,1);
    % Global matrices construction: (assemblage of K and F without BCs)
    %Matriz de Conecçso reduzida, so com Nós 
    %gNdRow= global node ''linha''
    ConnRes=Connect(:,4:7); % 
    for gNdRow=1:1:Nnodes  %correr as linhas da matriz K
        [elmts,iNds] = find(ConnRes==gNdRow);
        for ele=1:1:length(elmts)%correr os elementos selcionados
            iNdRow=iNds(ele);  %1º nó interno do 
            for gNdCol=1:1:Nnodes % %correr as colunas da matriz K

                [e,iNd] = find(ConnRes(ele,:)==gNdCol); % Procura os nós no elemento, encontra só um
                if (length(iNd)==1)
                    iNdCol=iNd;
                    %rangeK=[(2*gNdRow-1):(2*gNdRow); (2*gNdCol-1):(2*gNdCol)]
                    Krows = (2*gNdRow-1):(2*gNdRow); 
                    Kcols = (2*gNdCol-1):(2*gNdCol);
                    K(Krows, Kcols) = K(Krows, Kcols) +  KELE{ele}((2*iNdRow-1):(2*iNdRow),(2*iNdCol-1):(2*iNdCol)) ;     % Add entries at KGlobal
                end
            end
        end
    end
    %F(edof) = F(edof) + Fe;                 % Add entries at FGlobal
end
%    if Nnodes<=7
%    full(K)
%    tecla=input('enter to continue -->');
%   end
