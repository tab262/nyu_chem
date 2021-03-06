function DVR_anharmonicPotential = anharmonicPotential(m)
%Problem Set 3 Anharmonic Potential

%Define Position Matrix
N = linspace(1,1000,1000); %Creating a row vector from 1-1000 with 1000 units
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
  
  PotentialNew = Potential;
  
  H = ((1/2)*matrix_size)+Potential;
  [FinalEigVecs, FinalEigVals] = eig(H);
  FinalEigVals_vector = diag(FinalEigVals);
  [FinalEigVals_Ascending, I] = sort(FinalEigVals_vector);
  
  %Similar treatment of eigen vectors
  FinalEigVecs_vector = diag(FinalEigVecs);
  [FinalEigVecs_Ascending, I] = sort(FinalEigVecs_vector);
  
 for  r = 1:1000
  SortedEigVectors(:, r)= FinalEigVecs(:, I(r));
 end
  
  
  %Plot n=0, n=4, n=5, n=12, n=13, and n=23
  nfactorial=@(n) factorial(n);
  Psi = @(n,x) ((1/((2^n)*(nfactorial(n))))^0.5)*((1/pi)^(0.25))*exp(-x^2/2)*mfun('H', n, x);
  
  %n = 0
  psi_one = @(x) ((0.998751922755950)*Psi(0,x))+((0.0479455430299064)*Psi(1,x))+((0.00373714867517814)*Psi(2,x))+((0.0133428144974440)*Psi(3,x))+(0.00188973127460514*Psi(4,x));
  
  fplot(psi_one, [-5,5]);
  
  %n = 4
  
  %psi_four = @(x) (0.374127448581281*Psi(3,x))+(-0.773265514659745*Psi(4,x))+(-0.46566048383905
  %
  %Below are solutions to #4
  Xnew = X;
  Conj0 = (SortedEigVectors(:,1))';
  I0 = Conj0*Xnew*SortedEigVectors(:,1);
  
  Conj5 = (SortedEigVectors(:,4))';
  I5 = Conj5*Xnew*SortedEigVectors(:,5);
  
  Conj12 = (SortedEigVectors(:,11))';
  I12 = Conj12*Xnew*SortedEigVectors(:,11);
  
  Conj23 = (SortedEigVectors(:,22))';
  I23 = Conj23*Xnew*SortedEigVectors(:,22);
  
end

