function [flag]=conv_diff(x);


% ---------------------
Kmax=500;               % max numero iterazioni
tol=10^(-6);           % tolleranza  
err=1;                 % inizializzazione
k=0;                   %   "    "
flag=0;  
h=10^(-6);
x=[0.15;0.1];
b=10^(-10);
Bk=zeros(2);
while k<Kmax && err>tol 
    old=x; %non salvo tutte le x, solo l'ultima
    Bk = [(F(x(1)+h,x(2))-F(x(1), x(2)))/h,(F(x(1),x(2)+h)-F(x(1), x(2)))/h];
    dx=Bk\F(x(1),x(2)); %risolvo il sistema lineare. uso \ 
    x=x-dx;  %uso il - perchè ho messo la F con il +                  
    k=k+1;
    % ---
    %disp(norm(x(1),x(2)))  % errore vero (valido SOLO se converge a [0,0])
    % ---
    err = norm(F(x(1),x(2)))     % test di arresto usando F. 
            %se voglio usare quello sugli scarti basta fare norma di x-old
    errore = norm(x);
    aux(k,1)=err;
end

%se convergo, capisco a cosa sto convergendo
 if err<=tol
     flag=1;        % caso "ROSSO"
    if norm(x)<0.001  %se sono molto vicino allo zero conergo a (0,0)
         flag=2;    % caso "BLU'"
     end
 end    

% -----------------------------
%  STAMPE
% -----------------------------
   disp('Numero di iterate')
   disp(k)
   disp('distanza da (0,0)') %sarebbe l'errore finale
   disp(norm(x))
   disp('Valore finale')
   disp(x)
   %disp(aux)

   % %ALTERNATIVA ALLA FUNZIONE INLINE.
 function [out] = F(x,y)
% % CALCOLA la funzione vettoriale di cui sto cercando lo zero
% % -- Alternativa alla inline --
 out=zeros(2,1);
 out(1) = atan(x)+(x+0.5)*y;
 out(2) = y*(2+cos(y))+2*x; 

 out(1)=out(1)+b*rand(1);
 out(2)=out(2)+b*rand(1);
 end
end