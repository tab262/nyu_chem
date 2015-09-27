function hp = V(dev)
%Hamiltonian Potential for particle in a box

Vbarrier = 2000;
[r,c] = size(dev);
hp = zeros(1,r);


for ii = 1:r
    
    if ( (dev(ii,ii) >= 0) && (dev(ii,ii) <= 0.4) )
        hp(ii) = 0;
        
    elseif ( (dev(ii,ii) > 0.4) && (dev(ii,ii) < 0.6) )
        hp(ii) = Vbarrier;
        
    elseif( dev(ii,ii) >= 0.6 && dev(ii,ii) <= 1)
        hp(ii) =(Vbarrier*0.1);
        
    else 
        hp(ii) = Inf;
    end
    
    
    
end

