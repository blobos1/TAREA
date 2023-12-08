A continuación, se presentan los multiples codigos que fueron utilizados en la primera y segunda parte de la tarea. Cada codigo tiene una descripción que explica su funcionalidad.

## PARTE 1
# FUZZING
Este codigo tiene como objetivo hacer "fuzz" udp cuando el servidor le envia el video al cliente, el cual esta usando ffplay.
<pre>
    target_ip = "127.0.0.1"  
target_port = 8554
def send_fuzzed_packet():
    udp_packet = IP(dst=target_ip) / UDP(dport=target_port) / fuzz(Raw())
    send(udp_packet, verbose=True)
while True:
    send_fuzzed_packet()
</pre>



## PARTE 2
- Codigo 1:
Este codigo funciona como un "lagswitch", el comando provoca que por cada segundo aumente la latencia en 10 cada segundo, aumentando hasta que el protocolo llega a su limite y deje de funcionar correctamente.

<pre>
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
</pre>
El grafico generado por esto para cumplir con lo requerido es el siguiente:

![Screenshot_20231205_232805_WhatsApp](https://github.com/blobos1/TAREA/assets/152948326/ccee48ba-e248-4e91-8021-c3c847f4a6f2)

