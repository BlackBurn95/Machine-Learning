clear all;
x = [21,14,15,8];
y = [0,1,1,0];

it = 1000;
m = 4;

for i=1:m
    x(i) = x(i)/21;
    y(i) = y(i)/1;
end

j = 0;
a = 0.01;
h = zeros(1,4);
tmp = zeros(1,4);
tmp2 = zeros(1,4);
tmp3 = zeros(1,4);
tmp4 = zeros(1,4);
cost = zeros(1,it);

q0 = 1;
q1 = 1;

for t=1:it
    tmp = zeros(1,4);
    tmp2 = zeros(1,4);
    
    for i=1:m
        h(i) = q0+q1*x(i);
        h(i) = 1/(1+exp(-1*h(i)));
    end
    
    j = 0;
    for i=1:m
        if y(i)==1
            tmp3(i) = y(i)*log(h(i));
        end
        if y(i)==0
            tmp3(i) = (1-y(i))*log(1-h(i));
        end
        
        tmp(i) = h(i)-y(i);
        tmp2(i) = tmp(i);
        tmp(i) = tmp(i)^2;
        j = j+tmp3(i);
    end
    
    j = -1*(j/m);
    cost(t) = j;
    s = 0;
    s2 = 0;
    for i=1:m
        s = tmp2(i)+s;
        s2 = s2+tmp2(i)*x(i);
    end
    q0 = q0-a*(s/m)
    q1 = q1-a*(s2/m)
    
end
