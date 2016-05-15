function [ CB ] = CB_TP3(E,v,a,b)
c11=E/(1-v*v);
c12=v*c11; 
c21=c12;
c22=c11;
c33 = E /2 /(1+v);% Modulo de distorçao
%Aula Teorica 12 , pg 31
CB =  [];
CB(1,:) =  [ -c11/a -c12/b  c11/a   0       0  c12/b ];
CB(2,:) =  [ -c12/a -c22/b  c12/a   0       0  c22/b ];
CB(3,:) =  [ -c33/b -c33/a  0      c33/a   c33/b   0 ];

end
 