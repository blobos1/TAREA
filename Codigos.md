A continuación, se presentan los multiples codigos que fueron utilizados en la primera y segunda parte de la tarea. Cada codigo tiene una descripción que explica lo que hace dicho codigo.

## PARTE 1




## PARTE 2
Codigo 1:
Este codigo funciona como un "lagswitch", el comando provoca que por cada segundo aumente la latencia en 10 cada segundo, aumentando hasta que el protocolo llega a su limite y deje de funcionar correctamente.

#!/bin/bash
iface="lo"
lag=0
max=10000
aug=10
tc qdisc add dev $iface root netem delay ${lag}ms
echo "Latencia a ${lag}ms"
while [ $lag -ne $max ]
do
    sleep 1
    tc qdisc change dev $iface root netem delay ${lag}ms
    lag=$((lag + aug))
    echo "Latencia a ${lag}ms"
done
tc qdisc del dev $iface root netem
echo "Listo"
