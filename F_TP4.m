
%verificar que se já tirei do .txt tx e ty!!
%
%       _______ (5,6)
% (7,8)|       |-»     
% (1,2)|_______|-»
%               (3,4)
% Só temos força nos graus de liberdade 3,4,5,e 6
function [FELE] = F_TP4 (b)

FELE = [ 0  0  b/2  b/2  b/2  b/2 0  0];
% (Grau de liberdade 1, gdl 2, gdl 3.......)
end

