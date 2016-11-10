
%%--- 4 variable linear regression --%%
%%--- Abedalmjeed Abu-Taleb --%%

alpha = 0.5;
it = 100000;
n = 4; %num of var
m = 4; %num of training example
th0 = 1;
th1 = 1;
th2 = 1;
th3 = 1;
th4 = 1;

cost = zeros;
h = zeros;

x = [2104, 5, 1, 45; 1416, 3, 2, 40; 1534, 3, 2, 30; 852, 2, 1, 36]; %input data
y = [460,232,315,178]; %output data

%normalization -----------
for i=1:n
    mx = x(1,i);
    for j=1:m
        mx = max(mx,x(j,i));
    end
    for j=1:m
        x(j,i) = x(j,i)/mx;
    end
end

mx = y(1);
for i=1:m
    mx = max(mx,y(i));
end
for i=1:m
    y(i) = y(i)/mx;
end
%------------- end of normalization


bestCost = 1e18;
bth0 = -1;
bth1 = -1;
bth2 = -1;
bth3 = -1;
bth4 = -1;

%loop number of iteration
for t=1:it
    hy = 0;
    hy2 = 0;
    hyx1 = 0;
    hyx2 = 0;
    hyx3 = 0;
    hyx4 = 0;
    
    for i=1:m
        h(i) = th0 + th1*x(i,1) + th2*x(i,2) + th3*x(i,3) + th4*x(i,4);
        
        hy = hy + h(i)-y(i);
        hy2 = hy2 + (h(i)-y(i))^2;
        hyx1 = hyx1 + (h(i)-y(i))*x(i,1);
        hyx2 = hyx2 + (h(i)-y(i))*x(i,2);
        hyx3 = hyx3 + (h(i)-y(i))*x(i,3);
        hyx4 = hyx4 + (h(i)-y(i))*x(i,4);
    end
    
    cost(t) = (1/(2*m))*hy2;
    
    if(cost(t) < bestCost) 
        bestCost = cost(t);
        bth0 = th0;
        bth1 = th1;
        bth2 = th2;
        bth3 = th3;
        bth4 = th4;
    end
    
    %update theta's
    th0 = th0-alpha*(1/m)*hy;
    th1 = th1-alpha*(1/m)*hyx1;
    th2 = th2-alpha*(1/m)*hyx2;
    th3 = th3-alpha*(1/m)*hyx3;
    th4 = th4-alpha*(1/m)*hyx4;
end
%---------- end

%--- print best values of theta's
display(bth0);
display(bth1);
display(bth2);
display(bth3);
display(bth4);
%----------- end
