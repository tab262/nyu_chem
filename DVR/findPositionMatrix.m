function positionMatrix = findPositionMatrix( m, n, l )
%Position Matrix

positionMatrix = zeros(m,n);
 
for i = 1:m
    
    for j = 1:n
        %fprintf('(%f) ', findPosition(i,j,l))
        positionMatrix(i,j) = findPosition(i,j,l);
    end
    
    %fprintf('\n')
    if rem(i,100) == 0
        disp('fpm')
        disp(i) 
    end
        
end
end


