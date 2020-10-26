file1 = 'data.txt';
file2 = 'lable.txt';
delimiterIn = ' ';
headerlinesIn = 0;
A = importdata(file1,delimiterIn,headerlinesIn);
Y = importdata(file2,delimiterIn,headerlinesIn);

alpha = 1e-1;
eps = 1e-5;

data_len = size(Y, 1);
var_len = size(A, 2);
sse = 0; sse_new = 0;
x = zeros(var_len,1);
grad_x = zeros(var_len,1);
count = 0;
for step = 1:1000000
    count = count + 1;
    for j = 1:data_len
        base = A(j,:)*x - Y(j);
        grad_x = (A(j,:).*base)';
    end
        grad_x = grad_x/data_len;
        
        x = x - alpha .* grad_x;
        
        for k = 1:data_len
            sse_new = sse_new + power((A(k,:)*x-Y(k)),2);
        end
        sse - sse_new
    if abs(sse_new - sse)<eps
        break
    else
        sse = sse_new;
    end
    
    if abs(sse_new - sse)<eps
        break
    end
end
