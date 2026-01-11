# Ricerca_degli_zeri 

## Problema
Questo progetto riguarda l'implementazione e il confronto di diversi metodi numerici per la ricerca degli zeri di una funzione non lineare multivariata.

La funzione analizzata $F: \mathbb{R}^{2}\rightarrow\mathbb{R}^{2}$ è definita come:

$$
F(x,y) = \begin{pmatrix} 
\arctan(x) + (x + 1/2)y \\ 
y(2 + \cos(y)) + 2x 
\end{pmatrix}
$$
  
Il sistema presenta uno zero nell'origine delle coordinate $(\overline{x},\overline{y})=(0,0)$.

## Metodi Implementati
Il repository contiene le implementazioni dei seguenti algoritmi per la risoluzione del sistema:
- [Metodo di Newton](conv_study.m).
- [Metodo delle Corde](conv_study.m).
- [Metodo di Newton-Jacobi](conv_study.m).
- [Metodo di Broyden diretto](conv_study_Br.m) e [Metodo di Broyden indiretto](conv_study_Br2.m).
- [Metodo delle Differenze](conv_diff.m).

## Analisi della Convergenza
Viene effettuato uno studio sulla velocità e sui bacini di convergenza dei metodi elencati:
- **Velocità di convergenza**: Confronto dell'errore ad ogni iterazione partendo da un punto iniziale fissato.
- **Bacini di convergenza**: Studio della stabilità su una griglia uniforme di punti iniziali in un dominio $[-2,2] \times [-2,2]$.
- **Criteri di arresto**: Gli algoritmi terminano quando la norma della funzione è inferiore a una soglia prestabilita (es. $10^{-10}$ o $10^{-5}$) o al superamento di un numero massimo di iterazioni.

## Analisi di Robustezza ed Errore
Nella parte addizionale dell'esame, viene analizzato il comportamento del metodo delle Differenze in presenza di perturbazioni casuali nel calcolo della funzione (per simulare errori di misurazione o di precisione di macchina).
Variando il fattore $h$ utilizzato nelle differenze e la perturbazione, viene analizzato il comportamento del metodo delle differenze.

---
# Relazione
I risultati ottenuti dallo studio del problema sono riportati e analizzati nel seguente [file](EsameAnalisiNumericaRicercaZeri.pdf).
