alpha = 0.5;
th0 = 1.0;
th1 = 1.0;
it = 1000;

m = 7;
x = [21,26,145,789,45,32,45];
y = [100,246,135,759,425,62,454];

Jsurf = zeros(it);
for i = 1:it
    for j = 1:it
        Jsurf(i,j) = 1e9;
    end
end
th0_val = zeros;
th1_val = zeros;

mx1 = 0;
mx2 = 0;

bestJ = 1e18;
bestTh0 = 0;
bestTh1 = 0;

for i = 1:m
    mx1 = max(mx1,x(i));
    mx2 = max(mx2,y(i));
end

for i = 1:m
    x(i) = x(i)/mx1;
    y(i) = y(i)/mx2;
end

for i = 1:it
    h = zeros;
    hy = zeros;
    hy2 = zeros;
    hyx = zeros;
    
    sum_hy = 0;
    sum_hy2 = 0;
    sum_hyx = 0;
    
    for j = 1:m
        h = [h th0+th1*x(j)];
        hy = [hy h(j)-y(j)];
        hy2 = [hy2 hy(j)^2];
        hyx = [hyx hy(j)*x(j)];
        
        sum_hy = sum_hy + hy(j);
        sum_hy2 = sum_hy2 + hy2(j);
        sum_hyx = sum_hyx + hyx(j);
    end
    
    J = (1/2*m)*sum_hy2;
    
    if(J < bestJ) 
        bestJ = J;
        bestTh0 = th0;
        bestTh1 = th1;
    end;
    
    Jsurf(i,i) = J;
    
    tmpTh0 = th0-alpha*(1/m)*sum_hy;
    tmpTh1 = th1-alpha*(1/m)*sum_hyx;
    
    th0_val(i) = th0;
    th1_val(i) = th1;
    
    th0 = tmpTh0;
    th1 = tmpTh1;
end

display(bestJ);
display(bestTh0);
display(bestTh1);

surf(th0_val,th1_val,Jsurf);
!surf(th0_val,th1_val,Jsurf);
