cd estaciones
sed -e 's|/\([0-9][0-9]\)/\([0-9][0-9]\);|/\1/\2;'estacion1';|' estacion1.csv > estacion_1.csv
sed -e 's|/\([0-9][0-9]\)/\([0-9][0-9]\);|/\1/\2;'estacion2';|' estacion2.csv > estacion_2.csv
sed -e 's|/\([0-9][0-9]\)/\([0-9][0-9]\);|/\1/\2;'estacion3';|' estacion3.csv > estacion_3.csv
sed -e 's|/\([0-9][0-9]\)/\([0-9][0-9]\);|/\1/\2;'estacion4';|' estacion4.csv > estacion_4.csv
sed -e '1 s/;/,/g' estacion_1.csv > estacion_1_.csv
sed -e 's|\([A-Z]*\),\([A-Z]*\),\([A-Z]*\),\([A-Z]*\)|'DD';'MM';'AA';'Estacion';'Hora';'Minutos';'Segundos';\3;\4|' estacion_1_.csv > estacion__1.csv
sed -e 1d estacion_2.csv > estacion__2.csv
sed -e 1d estacion_3.csv > estacion__3.csv
sed -e 1d estacion_4.csv > estacion__4.csv
sed -e 's/,/./g;s/;/,/g;s/:/,/g;s/\//,/g' estacion__*.csv > pruebas.csv
sudo apt-get install -y csvkit
csvsql --query 'select Estacion,AA as Año,avg(VEL) as Velocidad_promedio from pruebas group by Estacion,AA' pruebas.csv > velocidad_estacion_año.csv
csvsql --query 'select Estacion,MM as Mes,avg(VEL) as Velocidad_promedio from pruebas group by Estacion,MM' pruebas.csv > velocidad_estacion_mes.csv
csvsql --query 'select Estacion,Hora,avg(VEL) as Velocidad_promedio from pruebas group by Estacion,Hora' pruebas.csv > velocidad_estacion_hora.csv
cat velocidad_estacion_año.csv
cat velocidad_estacion_mes.csv
cat velocidad_estacion_hora.csv
rm {estacion_1.csv,estacion_2.csv,estacion_3.csv,estacion_4.csv,estacion_1_.csv,estacion__1.csv,estacion__2.csv,estacion__3.csv,estacion__4.csv,pruebas.csv}
