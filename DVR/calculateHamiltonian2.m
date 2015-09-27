function psi = calculateHamiltonian2( m )
%HAMILTONIAN Particle in Asymmetric Wells

L = 1;
mass = 1;
X = findPositionMatrix(m,m,L);

[evec, eigval] = eig(X);

%dev = eigval
VX = V(eigval);
VXorg = evec*(diag(VX))*evec';

pSquared = (meshgrid(1:m).^2)*(pi^2);

KE = (pSquared)/(2*mass);
%size(KE)

H = KE + VXorg;

[Hevec, Heigval] = eig(H);
size(Hevec)

x=linspace(-L/2,L/2,m); % spatial grid
jj=meshgrid(1:m);
bx=bsxfun(@times,ones(m),permute(x,[3 1 2]));
psiu=squeeze(sum(sqrt(2/L)*repmat(Hevec,1,1,numel(x)).*sin(bsxfun(@times,jj', pi/L*(bx+L/2))),1)).' ;
%sorting according to the eigen-energies
[sortedEV, t]=sort(diag(Heigval));
psi=psiu(:,t);

subplot(1,1,1);
plot(x,VX,'r'); hold on;
for k=400:410
    plot(x,sortedEV(k)+abs(psi(:,k)).^2,'b'); hold on
end
ylim([min(U(alpha,x)),1.1*sortedEV(k)]);
xlabel('x');
ylabel('energy');
title('Eigenstates and eigen-energies');


