function [tp, yp] = rk4(dydt, tspan, y0, h, varargin) 

    if nargin < 4 % nargs throws an error 
        error("minimum of 4 arguments required");
    end

    if any(diff(tspan) <= 0) 
        error("time must go from negative to positive");
    end

    n = length(tspan);
    ti = tspan(1);
    tf = tspan(n);

    if n == 2
        t = (ti:h:tf);
        n = length(t);
        if t(n) < tf
            t(n + 1) = tf;
            n = n + 1;
        end
    else
        t = tspan;
    end
    tt = ti; 
    y(1,:) = 0;
    np = 1;
    t(np) = tt;
    yp(np, :) = y(1,:);
    i = 1;

    while(1)
        tend = t(np + 1);
        if hh>h 
            hh = h;
        end

    while(1)
        if tt+hh > tend 
            hh = tend-tt;
        end
        
        k1 = dydt(tt, y(i,:), varargin{:});
        ymid = y(i,:) + k1*hh/2;
        k2 = dydt(tt + hh/2, ymid, varargin{:});
        ymid = y(i,:) + k2*hh/2;
        k3 = dydt(tt + hh/2, ymid, varargin{:});
        phi = (ki + 2*(k2 + k3) +k4)/6;
        y(i+1, :) = y(i, :) + phi*hh;
        tt = tt + hh;
        i = i + 1;
        if tt >= tend
            break;
        end        
    end

    np = np + 1;
    tp(np) = tt;
    yp(np, :) = y(i, :);

    if tt >= tf
        break;
    end
    end
end % added this