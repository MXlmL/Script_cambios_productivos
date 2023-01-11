# !/bin/bash
usuario="jboss7"
fecha=$(date +'%Y-%m-%d')
ruta="RUTA MODIFICADA PARA EVITAR FILTRACIONES DE INFORMACIÓN SENSIBLE"
archivoViejo="reemplazable.txt"
archivonuevo="*.txt"
echo "**************************************************************"
echo "                OPTIMIZACIÓN EN CAMBIOS PRODUCTIVOS                  "
echo " "
echo " Recuerda crear nueva carpeta donde debe estar este script y el archivo de cambio "
echo ""
echo "*************************************************************** " 
mkdir Archivo_nuevo
mv $archivonuevo Archivo_nuevo
read -p "Ingresa la ip del equipo jboss (Dicho equipo ya debe estar fuera de balanceo): " ip
scp $usuario@$ip:$ruta/$archivoViejo $archivoViejo-$fecha
echo "Se descargó el archivo"
echo "Validación md5 del viejo archivo: " 
md5sum $archivoViejo-$fecha
echo "Enviando archivo"
scp Archivo_nuevo/$archivonuevo $usuario@$ip:$ruta
echo "Validación MD5 del nuevo archivo: "
md5sum Archivo_nuevo/*
#ssh $usuario@$ip ./Reinicio-Nocturno.sh //Esta linea accede por ssh a la ip especificada y reinicia el script de su hombre llamado 'Reinicio-Nocturno'





