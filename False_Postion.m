
% False Position
% To find f(x)=0 given continous function on [p0,p1] where f(p0) and f(p1) have opposite signs
syms x;

% User Inputs
y = input('Enter the non-linear equation:f(x)= ');
p0 = input('Enter first initial approximation: ');
p1 = input('Enter second initial approximation: ');
tol = input('Enter Tolerance TOL: ');
n = input('Enter the number of iterations you want to perform: ');

i=2;
q0 = eval(subs(y,x,p0));
q1 = eval(subs(y,x,p1));
if q0*q1>0
    disp('Wrong inputs p0 and p1. Re run program with correct inputs');
else
    p=cell(n,1);
    while (i<=n)
        if q1==q0
            fprintf('Division by zero. Terminating!');
            break;
        end
        p{i} = p1 - q1*(p1-p0)/(q1-q0);
        if abs(p{i}-p1) < tol
            fprintf('\nProcedure completed successfully\n');
            fprintf('The root is: %f\n',p{i});
            break;
        else
            q = eval(subs(y,x,p{i}));
            if q*q0<0
                p0=p1;
                q0=q1;
                i=i+1;
            else
                p1=p{i};
                q1=q;
                i=i+1;
            end
        end
    end
    if i==n+1
        fprintf('\nMethod failed after N0 iterations N0 = %d',n);
        fprintf('\nThe procedure was unsuccesful\n');
    end

    %To print the required table
    disp('FALSE POSITION');
    fprintf('n\t\t\tpn');
    fprintf('\n%d\t\t\t%f\n',0,p0);
    fprintf('%d\t\t\t%f\n',1,p1);
    for i=2:n
        fprintf('%d\t\t\t%f\n',i,p{i});
    end
end