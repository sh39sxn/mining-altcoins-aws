#!/bin/bash

#mine LTC
while true
do
    timeout -sHUP 10m ./ccminer -a scrypt -o stratum+tcp://ltc.pool.minergate.com:3336 -u md8Nf41@gmail.com -p x
    timeout -sHUP 1m ./ccminer -a scrypt -o stratum+tcp://ltc.pool.minergate.com:3336 -u md8Nf41@gmail.com -p x
done
