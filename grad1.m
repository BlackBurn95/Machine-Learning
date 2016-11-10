clear all;
x = [21,14,15,8];
y = [46,23,31,1];
it = 1000;
n = 1;
m = 4;
a = 0.01;

for i=1:m
    x(i) = x(i)/21;
    y(i) = y(i)/46;
end

h = zeros(1,m);
cost = zeros(1,m);
th = zeros(1,n+1);
tmp_th = zeros(1,n);
tmp0 = zeros(1,m);
tmp1 = zeros(1,m);
cost = zeros(1,it);

for t=1:it
    s = zeros(1,3);
    for i=1:m
        h(i) = th(1)+th(2)*x(i);
        tmp0(i) = h(i)-y(i);
        s(1) = s(1) + tmp0(i);
        tmp1(i) = tmp0(i)*x(i);
        s(2) = s(2) + tmp1(i);
        s(3) = s(3) + tmp0(i)^2;
    end
    
    cost(t) = s(3)/(2*m);
    for i=1:n
        th(i) = th(i)-a*s(i);
    end
end
