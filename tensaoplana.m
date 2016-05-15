%--------------------------------------------------------------------------
% FINITE ELEMENT CODE FOR a Planar Stress	
% Classic Theory * O
% version 01 M.O.B.C - 05 May 2016 
% version 00 inspired on FINITE ELEMENT CODE FOR a 2node (linear) unidimensional ELASTOSTATIC BAR version 02 M.M. Neves - 14Apr2016 (Pratical lesson P7) 
%--------------------------------------------------------------------------
%%function FEA
%
clear all;
clc;
%
fprintf(1,'\n\n------------------------------------------------------\n');
fprintf(1,'\n    FINITE ELEMENT ANALYSIS OF a Planar Stress		     \n');
fprintf(1,'\n------------------------------------------------------\n\n');
%tecla=input('enter to continue -->');
%--------------------------------------------------------------------------
% PRE-PROCESSING (1):
%--------------------------------------------------------------------------
% Input data including Physical properties:
tecla=input('enter to continue -->');
lerFich
%--------------------------------------------------------------------------

% Element stiffness matrix construction (EE,AA,le equals in all elements):
% Distributed load construction (qq, le equal in all elements):
[FELE, KELE ] = buildKELE(Nelem, Connect, nodeCoord, EE, VV);

%--------------------------------------------------------------------------
% GLOBAL SOLUTION
%--------------------------------------------------------------------------
% Definition of global matrices: (avoid dynamic allocation and full
% matrices)

% Global matrices construction: (assemblage of K and F without BCs)
%K = buildK(Nnodes, Connect, KELE);
K = buildK(Nnodes, Nelem, Connect, KELE);
F = 1.0*buildF(Nnodes, NTI, TI, FELE);
% Impose Boundary conditions:
[fixeddofs, freedofs] = buildFreedofs(Nnodes, CFE);
%--------------------------------------------------------------------------
% PROCESSING (2): Static Solution
%--------------------------------------------------------------------------
U(freedofs,:)  = K(freedofs,freedofs)\F(freedofs,:);  %Gauss (do not invert)

%--------------------------------------------------------------------------
% POST PROCESSING 
%--------------------------------------------------------------------------

Uf=full(U);
indx=1:2:2*Nnodes;
Ux=Uf(indx);
indx=2:2:2*Nnodes;
Uy=Uf(indx);
for i=1:1:Nnodes
    fprintf(1,'Node: %d, Displacement X: %14.7e m Y: %14.7e m\n',i, Ux(i), Uy(i));
end
max_disp_x = max(abs(Ux));
max_disp_y = max(abs(Uy));
fprintf(1,'\n     -> Maximum Displacement X: %14.7e m Y: %14.7e m\n\n',max_disp_x,max_disp_y);
ED_num2= full(1/2*U'*F)                                      % 1/2 work force
fprintf(1,'\n     -> Energia de Deformação elastice : %14.7e J \n\n', ED_num2);
%
% Plot
%
Graf
GrafTensoes

