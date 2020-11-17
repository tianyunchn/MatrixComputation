%Implementation of the power method for calculating the eigenvectors and eigenvalues of a matrix
function lambda_k = power_iter(A)
q = zeros(100,2);
q(1,:) = rand(1,2);
z = zeros(100,2);
lambda = zeros(100,1);
[V,D] = eig(A);
D_len = size(D);
max = D(1,1);
for i = 1:D_len
    temp = D(i,i);
    if temp > max
        max = temp;
    end
end

for k = 2:100
    z(k,:) = (A*q(k-1,:)')';
    q(k,:) = z(k,:)/norm(z(k,:));
    lambda(k) = q(k,:)*A*q(k,:)';
    if abs(lambda(k)-max)<0.01
        max_eigvalue = lambda(k); 
        break
    end
end
lambda_k = max_eigvalue;
end
