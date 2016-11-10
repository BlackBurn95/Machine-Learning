clear all;
x = [21,14,15,8];
y = [46,23,31,1];
it = 1000; 
m = 4;

for i=1:m
    x(i) = x(i)/21;
    y(i) = y(i)/46;
end

a = 0.41;
h = zeros(1,4);
temp = zeros(1,4);
temp2 = zeros(1,4);
cost = zeros(1,it);
q0 = 1;
q1 = 1;

for t=1:it
    temp = zeros(1,4);
    temp2 = zeros(1,4);
    
    for i=1:m
        h(i)=q0+q1*x(i);
    end
    
    tt = 0;
    hy = 0;
    hy2 = 0;
    hyx = 0;
    
    for i=1:m
        tt = h(i)-y(i);
        hy = hy+tt;
        hy2 = hy2 + tt^2;
        hyx = hyx + tt*x(i); 
    end
    
    cost(t) = hy2/(1*m);
    
    q0 = q0 - a*(hy/m);
    q1 = q1 - a*(hyx/m);
end