% SARANSH PRUTHI 2019B4A70718G
% Newton's Method
% To find f(x)=0 given and initial approximation p0
syms x;

% User Inputs
y = input('Enter the non-linear equation:f(x)= ');
p0 = input('Enter initial approximation: ');
init=p0;
tol = input('Enter Tolerance TOL: ');
n = input('Enter the number of iterations you want to perform: ');

% Derivative
g = diff(y,x);

i=1;
p=cell(n+1,1);
while i<=n+1
    fp0 = eval(subs(y,x,p0));
    gp0 = eval(subs(g,x,p0));
    if gp0 == 0
        fprintf('Division by zero. Ending program');
        break;
    end
    p{i} = p0-(fp0/gp0);

    %To compare stopping criterias
        
    if i==n+1 %(n+1 to print unsuccessful procedure if i>n i.e. i=n+1)
        fprintf('\nMethod failed after N0 iterations N0 = %d',n);
        fprintf('\nThe procedure was unsuccesful');
        break;
    else
        if abs(p{i}-p0)<tol
            fprintf('\nProcedure completed successfully\n');
            fprintf('The root is: %f\n',p{i});
            break;
        else
            p0 = p{i};
            i=i+1;
        end
    end
end

%Table for Newton's Method
fprintf("\t\tNewton's Method\n");
fprintf('n\t\t\tpn\n');
fprintf('%d\t\t\t%f\n',0,init);
for i=1:n
    fprintf('%d\t\t\t%f\n',i,p{i});
end