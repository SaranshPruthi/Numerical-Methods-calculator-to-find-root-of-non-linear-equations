
% Secant Method
% To find f(x)=0 given and initial approximation p0 and p1
syms x;

% User Inputs
y = input('Enter the non-linear equation:f(x)= ');
p0 = input('Enter first initial approximation: ');
p1 = input('Enter second initial approximation: ');
tol = input('Enter Tolerance TOL: ');
n = input('Enter the number of iterations you want to perform: ');

% Derivative
g = diff(y,x);
h = diff(g,x); %2nd differential of y wrt x
i=2;
q0 = eval(subs(y,x,p0));
q1 = eval(subs(y,x,p1));
p=cell(n,1);
while (i<=n)
    if q1==q0
        fprintf('Division by zero. Terminating!');
    end
    p{i} = p1 - q1*(p1-p0)/(q1-q0);
    if abs(p{i}-p1) < tol
        fprintf('\nProcedure completed successfully\n');
        fprintf('The root is: %f\n',p{i});
        n=i; %So that table prints till this value only as TOL is satisfied
        break;
    else
        p0=p1;
        q0=q1;
        p1=p{i};
        q1=eval(subs(y,x,p{i}));
        i=i+1;
    end
end
if i==n+1
    fprintf('\nMethod failed after N0 iterations N0 = %d',n);
    fprintf('\nThe procedure was unsuccesful');
end

%To print the required table
disp('SECANT METHOD');
fprintf('n\t\t\tpn');
fprintf('\n%d\t\t\t%f\n',0,p0);
fprintf('%d\t\t\t%f\n',1,p1);
for i=2:n
    fprintf('%d\t\t\t%f\n',i,p{i});
end