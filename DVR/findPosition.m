function position = findPosition( m, n, l )
%Position for Particle in a Box

    if m == n
       position = (l/2); 
    else
        x = ((-1)^(m+n) - 1);
        y = (4*l*m*n);
        numerator = x*y;
        denominator = (((m^2)-(n^2))^2)*(pi^2);
        position = numerator/denominator;
        
    end
end
