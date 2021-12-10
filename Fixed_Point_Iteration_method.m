
% Fixed Point Iteration Method
% To find g(p)=p given an initial approximation p0

syms x;

% Defining all 5 g(x)=x from part a to e in form of cells and taking in inputs
% p0 = input('Enter the initial approximation: ');
p0 = 1.50; %Given in question to generate tables according to p0=1.5
g=cell(5,1);
g{1}=x-x^3-4*x^2+10;
g{2}=((10/x)-4*x)^0.5;
g{3}=0.5*((10-x^3)^0.5);
g{4}=(10/(4+x))^0.5;
g{5}=x-((x^3+4*x^2-10)/(3*x^2+8*x));
tol = input('Enter Tolerance TOL: ');
n = input('Enter the number of iterations you want to perform: ');


% Fixed Point Iteration Method
i=1;
p=cell(n,5);
while i<=5
    j=1;
    p0=1.50;
    while j<=n
        p{i,j}=eval(subs(g{i},x,p0));
        if j==n
            fprintf('\nMethod failed after N0 iterations N0 = %d',n);
            fprintf('\nThe procedure was unsuccesful');
            i=i+1;
            break;
        else
            if abs(p{i,j}-p0)<tol
                fprintf('\nProcedure was successful\n');
                fprintf('p is: %f\n',p{i,j});
                i=i+1;
                break;
            else
                p0=p{i,j};
                j=j+1;
            end
        end
    end
end
%Printing the required table
fprintf('\n\nn\t\ta\t\t\tb\t\t\tc\t\t\td\t\te\n');
fprintf('%d\t%f\t%f\t%f\t%f\t%f\n',0,p0,p0,p0,p0,p0);
for j=1:n
    fprintf('\n%d',j);
    for i=1:5
        fprintf('\t%f\t%f\t%f\t%f\t%f',p{i,j},p{i,j},p{i,j},p{i,j},p{i,j});
    end
end
                
            
    
    