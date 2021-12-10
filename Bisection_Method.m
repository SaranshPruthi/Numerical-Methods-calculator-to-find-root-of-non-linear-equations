
% Bisection Method
% To find f(x)=0 assuming f(x) is continous on [a,b]

syms x;

% User Inputs
y = input('Enter the non-linear equation:f(x)= ');
a = input('Enter a in [a,b] such that f(a).f(b)<0: ');
b = input('Enter b in [a,b] such that f(a).f(b)<0: ');
tol = input('Enter Tolerance TOL: ');
n = input('Enter the number of iterations you want to perform: ');

% Evaluating value of f(x) at a and b
fa = eval(subs(y,x,a));
fb = eval(subs(y,x,b));

% Bisection Method
if fa*fb > 0 %To check if given a and b staisy the criteria f(a).f(b)<0 or not
    disp('Given initial values do not satisfy f(a).f(b)<0. Re run the program with correct values of f(x), a and b');
else
    i=1;
    p=cell(n+1,1);
    fprintf('\n\nn\t\tan\t\t\tbn\t\t\tpn\t\t\tf(pn)\n');
    while i<=n+1 %(n+1 to print unsuccessful procedure if i>n i.e. i=n+1)
        p{i} = a+(b-a)/2;
        fpn = eval(subs(y,x,p{i}));
        
        %To compare stopping criterias
        
        if i==n+1
            fprintf('%d\t%f\t%f\t%f\t%f\n',i,a,b,p{i},fpn);
            fprintf('\nMethod failed after N0 iterations N0 = %d',n);
            fprintf('\nThe procedure was unsuccesful');
            break;
        else
            if (fpn==0.0 || (b-a)/2 < tol)
                fprintf('%d\t%f\t%f\t%f\t%f\n',i,a,b,p{i},fpn);
                fprintf('\nProcedure completed successfully\n');
                fprintf('The root is: %f\n',p{i});
                break;
            else
                fprintf('%d\t%f\t%f\t%f\t%f\n',i,a,b,p{i},fpn);
                i=i+1;
                if fa*fpn > 0
                    a = p{i-1};
                else
                    b = p{i-1};
                end
            end
        end   
    end
end