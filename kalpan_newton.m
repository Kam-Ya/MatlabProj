function[b, func] = newtonPolyFunction(x, y)
    n = length(x);
    if length(y) ~= n, error('x and y must be same length'); end
    % Create finite difference table
    finDiffTable = zeros(n,n);
    % Assign dependent values to column 1
    finDiffTable(:,1) = y(:); % Reshape to column vector
    % nth order finite difference
    for j = 2:n
        for i = 1:n-j+1
            finDiffTable(i, j) = (finDiffTable(i+1, j-1)-finDiffTable(i, j-1))/(x(i+j-1)-x(i));
        end
    end
    % 1st order = b1 + b2(x-x1)
    b(1) = finDiffTable(1, 1);
    func = @(xVar) finDiffTable(1, 1); % Initialize as a function, set as b1
    xCurrent = @(xVar) 1;
    % Return 2nd term to n terms
    for k = 2:n
        % b terms
        b(k) = finDiffTable(1, k);
        % Old factor
        xPrevious = xCurrent;
        % New factor = previous new
        xCurrent = @(xVar) xPrevious(xVar)*(xVar - x(k-1));
        % Incrementally build function
        prevFunc = func; % Store previous terms
        func = @(xVar) prevFunc(xVar) + finDiffTable(1, k) * xCurrent(xVar);
    end
end