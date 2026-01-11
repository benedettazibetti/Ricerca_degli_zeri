function [flag]=conv_study_Br(x);
% --------------------
% Analogo all'altro file, ma esegue Broyden 
% VERSIONE diretta con le B_k
% --------------------
F  = inline('[atan(x)+(x+0.5)*y;y*(2+cos(y))+2*x]','x','y');
DF = inline('[1/(1+x^2)+y,x+0.5;2,(2+cos(y))- y*sin(y)]','x','y');
% ---------------------
Kmax=50;               % max numero iterazioni
tol=10^(-5);           % tolleranza  
err=1;                 % inizializzazione
k=0;                   %   "    "
%x=[0.15;0.1];  
%x=[0.3,0.2];
% ---------------------
flag=0;  % opzione per plot alla fine
Bk=DF(x(1),x(2));    % valore iniziale della Bk
xold=x;
dx=-Bk\F(x(1),x(2));
x=x+dx;
while k<Kmax && err>tol 
    % --- aggiornamento della Bk ---
    dF = F(x(1),x(2)) - F(xold(1),xold(2));
    Bk = Bk + (dF - Bk*dx)*dx'/(dx'*dx);  
    % ------------------------------
    %
    dx = -Bk\F(x(1),x(2));
    xold=x;
    x=x+dx;                    
    k=k+1;
    % ---
    % norm(x(1),x(2))  % errore vero (valido SOLO se converge a [0,0])
    % ---
    err = norm(F(x(1),x(2)));     % test di arresto usando F
    errore2=sqrt((x(1)-0.7371)^2+((x(2)+0.5134)^2));
    aux(k,1)=err;
end 
if err<=tol
    flag=1;
    if norm(x)<0.001 || errore2<0.001
        flag=2;
    end
end    


% -----------------------------
%  STAMPE
% -----------------------------
%disp(aux)
% disp('Numero di iterate')
% disp(k)
% disp('distanza da (0,0)')
% disp(norm(x))
% disp('Valore finale')
% disp(x)







