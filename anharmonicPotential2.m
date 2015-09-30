function DVR_anharmonicPotential = anharmonicPotential(m)
%Problem Set 3 Anharmonic Potential

%Define Position Matrix

N = linspace(1,1000,1000); %Define an m by m matrix here
a = N';
b = a.^(1/2);
c = b.*((1/2)^(1/2));
D = diag(c,-1);
E = diag(c,1);
X = D + E;

%Define P Matrix for Harmonic Oscillator
d = c.*1i*-1;
F = diag(d,1);

e = d.*(-1);
G = diag(e,-1);
P = F + G;

%Define P^2 Matrix
matrix_size = zeros(1000,1000);
for i = 1:998
    %In reference code, zeros(1000,1000), i = 1:998, j = i +2
    for j = i+2
        matrix_size(i,j) = (((i-1+1)*(i-1+2))^(1/2))/(-2);
    end
end

for i = 1:1000
    for j = i
        matrix_size(i,j) = (((2*(i-1))+1)/2);
    end
end
for i = (3:1000)
    for j = i-2
        matrix_size(i,j) = (((i-1-1)*(i-1))^(1/2))/(-2);
    end
end

  %Diagonalize X
  
  [eigVecX, eigValX] = eig(X);
  
  %Above, we are creating eigVecX which is a matrix with columns that are
  %the eigenvectors of X; and we get eigValX which is a matrix with
  %eigenvalues of X on the diagonal
  
  V=@(x) (0.5*x.^2)-(0.045*(x.^3))+(0.00107*(x.^4));
  f = diag(eigValX);
  g = V(f);
  h = diag(V(f));
  Potential = eigVecX*h*eigVecX'; %DVR (I changed the center variable to h rather than g)
  
  Potentialnew = Potential;
  
  H = ((1/2)*matrix_size)+Potential;
  [FinalEigVecs, FinalEigVals] = eig(H);
  FinalEigVals_vector = diag(FinalEigVals);
  [FinalEigVals_Ascending, I] = sort(FinalEigValsVector);
  
  sortedEigVectors (:, r) = FinalEigVectors(:, I(r));
  
  %Below is for plotting
  nfactorial=@(n) factorial(n);
  Psi = @(n,x) (1/((2^n)*(nfactorial(n)))^0.5)*(1/pi^0.25)*exp(-x^2/2)*mfun('H', n, x);
  
  %n = 0
  
  psi_one = @(x)
  
  %
  Xnew = X
  Conj0 = (SortedEigVectors(:,1))'
  
end

