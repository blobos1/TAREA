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
