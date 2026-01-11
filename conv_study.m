function [flag]=conv_study(x);
% -----------------------
% Metodi di Newton, Corde, Newton-Jacobi
% Input x come vettore COLONNA
% -----------------------
% clc;
% --------------------
F  = inline('[atan(x)+(x+0.5)*y;y*(2+cos(y))+2*x]','x','y');
DF = inline('[1/(1+x^2)+y,x+0.5;2,(2+cos(y))- y*sin(y)]','x','y');
% ---------------------
Kmax=50;               % max numero iterazioni (500 PER PUNTO 1 50 PER GLI ALTRI)
tol=10^(-5);           % tolleranza  (10^-10 PER PUNTO 1 10^-5 PER ALTRI PUNTI)
err=1;                 % inizializzazione
%x=[0.15;0.1];     %   "    " %%MI SERVE PER PUNTO 1 DEL FOGLIO DI ESERCIZI, PER PUNTO 2 USO GRIGLIA COME DA CONSEGNA
%x=[1.5;-1];
k=0;                   %   "    "
flag=0;  % (caso VERDE)
 %Bk=DF(x(1),x(2));   % CHORDS

while k<Kmax && err>tol 
    old=x;
    %Bk=DF(x(1),x(2));   % NEWTON
    Bk=diag(diag(DF(x(1),x(2))));        % NEWT.-JAC.
    dx=Bk\F(x(1),x(2));
    x=x-dx;                    
    k=k+1;
    % ---
    errore = norm(x); % errore vero (valido SOLO se converge a [0,0])
    errore2=sqrt((x(1)-0.7371)^2+((x(2)+0.5134)^2));
    % ---
    err = norm(F(x(1),x(2)));     % test di arresto usando F
end

if err<=tol
    flag=1;        % caso "ROSSO"
    if norm(x)<0.001 || errore2<0.001
        flag=2;    % caso "BLU'"
    end
end 

% -----------------------------
%  STAMPE
% -----------------------------

% disp('Numero di iterate')
% disp(k)
% disp('distanza da (0,0)')
% disp(norm(x))
% disp('Valore finale')
% disp(x)


% % ------------------------------------
% function [out] = F(x,y);
% % CALCOLA la funzione vettoriale di cui sto cercando lo zero
% % -- Alternativa alla inline --
% out=zeros(2,1);
% out(1) = atan(x)+(x+0.5)*y;
% out(2) = y*(2+cos(y))+2*x;  
% end
% % ------------------------------------






