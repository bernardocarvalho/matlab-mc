function freedofs = buildFreedofs(Nnodes, CFE)

fixeddofs=[];

for cd=1:1:length(CFE)
    fixeddofs(cd) = ( CFE(cd,1) - 1)*2 + CFE(cd,2);
end
fixeddofs
alldofs   = 1:(Nnodes * 2);
freedofs  = setdiff(alldofs,fixeddofs);  % used to remove lines and columns

end

