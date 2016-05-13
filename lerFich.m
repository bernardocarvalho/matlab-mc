% Exemplo : http://www.mathworks.com/help/matlab/examples/reading-arbitrary-format-text-files-with-textscan.html
%
nomeFicheiro='fichdados.txt';
fid = fopen(nomeFicheiro,'rt');
InputText = textscan(fid,'%s',1,'delimiter','\n');  % Read  header line
disp(InputText{1}{1})

%Matriz das Coornedanadas dos nós:
InputText = textscan(fid,'%f',1,'delimiter','\n');  
Nnodes = InputText{1};
fprintf(1,'Numero de Nos: %d\n', Nnodes );
InputText = textscan(fid,'%s',1,'delimiter','\n');  % Read  line
InputText = textscan(fid,'%f %f %f', Nnodes);  
nodeCoord = cell2mat(InputText);
InputText = textscan(fid,'%s',2,'delimiter','\n', 'CommentStyle', '%');  % Read  line
disp(InputText{1}{1})

%Matriz de conectividades:
InputText = textscan(fid,'%f',1,'delimiter','\n');  
Nelem = InputText{1};
fprintf(1,'Numero de Elementos: %d\n', Nelem );
InputText = textscan(fid,'%d%d%d%d%d%d%d', Nelem,'EmptyValue', 0);  
%InputText = textscan(fid,'%d %d %d %d% d% %d %d', Nelem);  
Connect = cell2mat(InputText);

%Propriedades dos Materiais:
InputText = textscan(fid,'%s',2,'delimiter','\n');  % Read  lines
disp(InputText{1})
InputText = textscan(fid,'%d',1,'delimiter','\n');  
Nmate = InputText{1};
fprintf(1,'Numero de Materiais: %d\n', Nmate );
InputText = textscan(fid,'%d%d%f%f%f', 1);  
EE       = InputText{3}               % Young's modulus (Pa)
VV       = InputText{4}  

%Carregamentos distribuidos:
InputText = textscan(fid,'%s',2,'delimiter','\n');
InputText = textscan(fid,'%f',1,'delimiter','\n');  
Fdis = InputText{1};
fprintf(1,'Fontes/carregamentos distribuídos: %d\n', Fdis );

%Condiçoes Fronteira Essenciais:
InputText = textscan(fid,'%s',1,'delimiter','\n');
InputText = textscan(fid,'%f',1,'delimiter','\n');  
NnodesCFE = InputText{1};
fprintf(1,'Numero de Nós CFE: %d\n', NnodesCFE );

%InputText = textscan(fid,'%s',1,'delimiter','\n');  % Read  line
InputText = textscan(fid,'%f %f %f', 2*(NnodesCFE+1)); 
CFE = cell2mat(InputText)

%Cargas Pontuais:
InputText = textscan(fid,'%s',2,'delimiter','\n');
InputText = textscan(fid,'%f',1,'delimiter','\n');  
Cpont = InputText{1};
fprintf(1,'Cargas Pontuais Impostas: %d\n', Cpont);

%Tensão imposta da fronteira:
InputText = textscan(fid,'%s',1,'delimiter','\n');
InputText = textscan(fid,'%f',1,'delimiter','\n');  
EleTen = InputText{1};
fprintf(1,'Tensões impostas da fronteira: %d\n', EleTen);
InputText = textscan(fid,'%f %f %f %f %f', EleTen);

TI = cell2mat(InputText)

fclose(fid);