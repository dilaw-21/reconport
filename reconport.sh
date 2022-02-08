#!/bin/bash

# echo -e "\e[1;41[[!]\e[1m"

read -p "Especifique el dominio o IP que desea escanera -> " dominio
clear

ping -c 1 $dominio > /dev/null

if test $? -ne 0
then
        echo ""
        bash -c "echo $'\e[1;31m'[-]$'\e[0m'  El nombre de dominio o IP no existe"
        exit
 
else
        echo "RECONPORT desarrollado Walid Merzouk (Dilaw)"
        echo "Hora de ejecucion: $(date)"
        echo ""
        function scan(){
                bash -c "echo  $'\e[1;33m'[*]$'\e[0m' escaneo de puertos sobre $puerto en proceso"
                for puerto in $(seq 1 65536); do
                        timeout 1 bash -c "echo '' > /dev/tcp/$dominio/$puerto" 2>/dev/null && bash -c "echo    $dominio,$puerto,open " >> $dominio.csv && bash -c "echo    $'\e[1;32m'             [+] $puerto $'\e[0m' -- Puerto abierto"  &
                done
        }

        scan
echo ""
echo "Este escaneo esta almacenado en $dominio.csv"

fi






