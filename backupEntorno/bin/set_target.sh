#!/bin/bash

ip_address=$(cat /home/akatun/.config/bin/target | awk '{print $1}')

machine_name=$(cat /home/akatun/.config/bin/target | awk '{print $3}')

if [ $ip_address ] && [ $machine_name ]; then

  echo "%{F#e51d0b} %{F#000000}$ip_address%{u-} - $machine_name"
else
    echo "%{F#e51d0b} %{u-}%{F#000000} No target Now"
fi
