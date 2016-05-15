function [ CB ] = CB_TP4(E,v,a,b)
c11=E/(1-v*v);
c12=v*c11; 
c21=c12;
c22=c11;
c33 = E /2 /(1+v);% Modulo de distorçao
%Aula Teorica 12 , pg 31
CB =  [];
CB(1,:) =  [ -c11/2/a     -c12/2/b c11/2/a  -c12/2/b c11/2/a  c12/2/b   -c11/2/a     c12/2/b ];
CB(2,:) =  [ -c21/2/a    -c22/2/b c21/2/a  -c22/2/b c21/2/a  c22/2/b   -c21/2/a     c22/2/b ];
CB(3,:) =  [ -c33/2/b    -c33/2/a -c33/2/b  c33/2/a c33/2/b  c33/2/a   c33/2/b     c33/2/a];

end

