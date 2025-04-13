function int = newton (x, y, t)

    n = length(x);
    if length(y) ~= n
        error("input matrices are not the same length");
    end

    b = zeros(n,n);

    b(:,1) = y(:);
    for j = 2:n
        for i = 1:n-j+1
            b(i,j) = (b(i + 1, j - 1) - b(i, j - 1))/(x(i+j-1) - x(i));
        end
    end

    xt = 1;
    int = b(1,1);
    for j = 1:n-1
        xt = xt*(t - x(j));
        int = int + b(1, j + 1)*xt;
    end

end