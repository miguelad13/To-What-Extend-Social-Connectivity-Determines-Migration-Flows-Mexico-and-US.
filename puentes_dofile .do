*exportar el excel
quietly import excel "C:/Users/migue/Downloads/Base de Datos.xlsx", sheet("2021") firstrow 
*indicar folder donde se guardarán las tablas 
cd "copiar y pegar la ruta del folder"
*especificar datos panel
xtset ID Year 
*tabla de correlación
corr Migration SCI Distance Poverty Unemployment Violence GDPMEX GDPUSA FDI Trade
*guardar tabla correlación
outreg2 using tablacorr.doc, word
*regresión usando xtreg, pols
xtreg Migration SCI Distance Poverty Unemployment Violence GDPMEX GDPUSA FDI Trade
*guardar tabla resultados
outreg2 using tablaregpols.doc, word
*regresión usando xtreg, fixed effect
xtreg Migration SCI Distance Poverty Unemployment Violence GDPMEX GDPUSA FDI Trade, fe
*guardar tabla resultados
outreg2 using tablaregfe.doc, word
*regresión xtreg con random effects
xtreg Migration SCI Distance Poverty Unemployment Violence GDPMEX GDPUSA FDI Trade, re
*guardar tabla de resultados
outreg2 using tablaregre.doc, word
*tabla de summary statistics
sum variables
*guardar tabla summary statistics
esttab using "direcciónfolder\nombre_aponer_archivo.doc", cells("mean(fmt(2)) sd(fmt(2)) min(fmt(2)) max(fmt(2))") label replace
