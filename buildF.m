function [ F ] = buildF(Nnodes, NTI, TI, FELE)
%
%       _______ (5,6)
% (7,8)|       |-»     
% (1,2)|_______|-»
%               (3,4)
% Só temos força nos graus de liberdade 3,4,5,e 6, nós internos 2 e 3
F   = sparse(Nnodes*2,1);
for tirow=1:1:NTI
    tiele = TI(tirow,1);
    ni2=TI(tirow,2);
    ni3=TI(tirow,3);
    fx=TI(tirow,4);
    fy=TI(tirow,5);

    F(2*ni2-1) = F(2*ni2-1) + FELE{tiele}(3) *fx;
    F(2*ni2) = F(2*ni2)     + FELE{tiele}(4) *fy;
    F(2*ni3-1) = F(2*ni3-1) + FELE{tiele}(5) *fx;
    F(2*ni3) =  F(2*ni3)    + FELE{tiele}(6) *fy;
end
