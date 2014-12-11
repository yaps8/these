set terminal pdf color
set xdata time
set timefmt "%d/%m/%y"
set output "stats.pdf"
set y2tics
FACTOR=0.003
#set xrange ["20/05/14":"30/12/14"]
#set yrange [17:120]
#set grid
set xlabel 'Date'
set ylabel 'Nombre'
#set key on left box
plot "plot.dat" using 1:2 with lines ti "Pages", "plot.dat" using 1:3 with lines ti "Todo", "plot.dat" using 1:(FACTOR*$4) with lines ti "Mots" 

