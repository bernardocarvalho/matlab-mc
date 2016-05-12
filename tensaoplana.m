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

%--------------------------------------------------------------------------
% GLOBAL SOLUTION
%--------------------------------------------------------------------------
% Definition of global matrices: (avoid dynamic allocation and full
% matrices)

% Element stiffness matrix construction (EE,AA,le equals in all elements):
[FELE, KELE ] = buildKELE(Nelem,Connect,nodeCoord, EE, VV);
% Global matrices construction: (assemblage of K and F without BCs)

K = buildK(Nelem,Connect,KELE);
% Distributed loadconstruction (qq, le equal in all elements):
Fe = qq* [  le/2;
            le/2];
% Impose Boundary conditions:
%--------------------------------------------------------------------------
% PROCESSING (2): Static Solution
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% POST PROCESSING (by now only displacement):
%--------------------------------------------------------------------------

%
% Plot
%
