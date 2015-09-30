function psi = calculateHamiltonian( m )
%HAMILTONIAN Particle in a Asymmetric Coupled Wells with Perturbations

L = 1;
mass = 1;
X = findPositionMatrix(m,m,L);

[evec, eigval] = eig(X);

%dev = eigval
VX = V(eigval);
VXorg = evec*(diag(VX))*evec'; %DVR

pSquared = (meshgrid(1:m).^2)*(pi^2);
pSquared_diagonalized = diag(diag(pSquared));

KE = (pSquared_diagonalized)/(2*mass);
%calculating KE for particle in a box

H = KE + VXorg;

[Hevec, Heigval] = eig(H);
%find eigenvectors and eigenvalues for the Hamiltonian

dx = 1.0/m;
x = 0:dx:.999;
%apparently this is unnecessary 

psi = zeros(m);
a = ((sqrt(2/L)*Hevec));
for ii=1:m
   b = (sin(ii*pi*x/L)); 
   psi(ii,:) = (a * b')'; 
end
%psi = sqrt(2/L)*sin(m*pi*x/L); 
%Here, I followed an example where the quantity(sqrt(2/L)) was multiplied by the eigenvectors of the Hamiltonian. 

sorted_Heigval = sort(diag(Heigval));
Heigval_diagonal_Matrix = diag(sorted_Heigval);
E = psi.*Hevec;

sortedE = sort(E);

subplot(1,1,1);
plot(x,VX,'r'); hold on; 

 for k=1:17
    plot(x, (sorted_Heigval(k,:))+(sortedE(k,:)),'b');
    hold on;   
 end
 
 ylim([min(VX),2500]);

end

