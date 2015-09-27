function MomentumSquaredMatrix = findMomentumSquaredMatrix(m,n)
%Position Matrix

positionMatrix = zeros(m,n);

for i = 1:m
    
    for j = 1:n
        %fprintf('(%f) ', findMomentumSquared(i,j))
        MomentumSquaredMatrix(i,j) = findMomentumSquared(j);
    end
    
    %fprintf('\n')
    if rem(i,100) == 0
        disp('fpm')
        disp(i) 
    end
        
end
end

