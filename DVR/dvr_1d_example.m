% This script shows an implementation of Discrete variable representation (DVR)
% to calculate the eigen energies and eigen states for time-independent 1D
% potentials in quantum mechanics using a "particle in a box" basis set. 


%  setting initial values of the system
h_bar=1; i1=sqrt(-1);
L=10;   % box size   
mass=1; % mass

% define a 1D potential
alpha = 0.5;
U = @(alpha,x) alpha*x.^2; 

%% Build "particle in a box" basis set (sin(n*pi.*x/L))
% this needs to be done just once, then V,D can be saved and reloaded
% for any later calculations

n=100; % # of basis functions to use
T = h_bar^2*pi^2*diag((1:n).^2)/(2*mass*L^2); % KE
[ii, jj] = meshgrid(1:n);
xx = 2*L*((ii+jj).^(-2)-(ii-jj).^(-2))/pi^2;
xx(mod(ii,2)==mod(jj,2))=0;
[V,D]=eig(xx);

%% obain eigenvalues and eigenvectors
v = V*diag(U(alpha,diag(D)))*V'; % DVR step
[V1,D1]=eig(T+v); 
% D1 are the eigen-energies, V1 are the eigen-states, to represnet the
% eigen-states in position space we project back to the x-coordinate
x=linspace(-L/2,L/2,1e3); % spatial grid
jj=meshgrid(1:n);
bx=bsxfun(@times,ones(n),permute(x,[3 1 2]));
psiu=squeeze(sum(sqrt(2/L)*repmat(V1,1,1,numel(x)).*sin(bsxfun(@times,jj', pi/L*(bx+L/2))),1)).' ;
%sorting according to the eigen-energies
[sortedEV, t]=sort(diag(D1));
psi=psiu(:,t);

%% plotting the potential and the first 10 eigen states seperated
%  by their eigen values

subplot(1,2,1);
plot(x,U(alpha,x),'r'); hold on;
for k=1:10
    plot(x,sortedEV(k)+abs(psi(:,k)).^2,'b'); hold on
end
ylim([min(U(alpha,x)),1.1*sortedEV(k)]);
xlabel('x');
ylabel('energy');
title('Eigenstates and eigen-energies');

hold off
% plotting all the eigen states
subplot(1,2,2);
imagesc(x,1:size(psi,2),abs(psi).^2');
colormap(jet(256));
set(gca,'YDir','normal')
xlabel('x');
ylabel('eigen state #');
title('|\psi|^2')
