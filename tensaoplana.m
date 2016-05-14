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
tecla=input('enter to continue -->');
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
U=full(U);
indx=1:2:2*Nnodes;
Ux=U(indx);
indx=2:2:2*Nnodes;
Uy=U(indx);

%--------------------------------------------------------------------------
% POST PROCESSING (by now only displacement):
%--------------------------------------------------------------------------

%
% Plot
%
