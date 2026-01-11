
% svolge l'esercizio 1.2 di Ottimizzazione per ...
% ... plottare il bacino di convergenza (su griglia N x N)
figure
N=40;  
X=linspace(-2,2,N);
d=length(X);
for i=1:d
    for j=1:d
        x=[X(i);X(j)];   
        %[flag]=conv_study(x);
        %[flag]=conv_study_Br(x);
        %[flag]=conv_study_Br2(x);
        [flag]=conv_diff(x);
        if flag==1 
            plot(x(1),x(2),'*r')
            hold on
        elseif flag==2
            plot(x(1),x(2),'*b')   % CONVERGENZA A ZERO-ZERO
            hold on
        else
            plot(x(1),x(2),'*g')   % NON CONVERGENZA
            hold on
        end
    end
end
hold off