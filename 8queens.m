% Solving the 8-Queens Problem with Simulated Annealing
% By: Tahmid Mehdi
% Nov 2014

x(1:8,1) = [1 2 3 4 5 6 7 8]';
T = 100000;
ii = 1;

while T > 0.0001
    p = [0 0 0 0 0 0 0 0]';
    y = [0 0 0 0 0 0 0 0]';
    for row = 1:8
        for j = 1:8
            z = [y(1:row-1)' j x(row+1:8,ii)']';
            p(j) = exp(-nqueens(z,8)/T);
        end
        p = p./sum(p);
        u1 = rand;
        for k = 1:8
            if u1>sum(p(1:k-1)) && u1<=sum(p(1:k))
                y(row) = k;
            end
        end
    end
           
    r = min(exp((nqueens(x,8)-nqueens(y,8))/T), 1);
    u = rand;
    if u <= r
        x(1:8,ii+1) = y;
    else
        x(1:8,ii+1) = x(1:8,ii);
    end
    ii = ii+1;
    T = T/2;
end
