#!/bin/sh

IFACE=$(/usr/sbin/ifconfig | grep proton0 | awk '{print $1}' | tr -d ':')
IFACE2=$(/usr/sbin/ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')


if [ "$IFACE" = "proton0" ]; then
  echo "Prtn %{F#b71c1c} %{F#000000}$(/usr/sbin/ifconfig proton0 | grep "inet " | awk '{print $2}')%{u-}"
elif [ "$IFACE2" = "tun0" ]; then
  echo "Htb %{F#b71c1c} %{F#000000}$(/usr/sbin/ifconfig tun0 | grep "inet " | awk '{print $2}')%{u-}"
else
  echo "%{F#b71c1c} %{F#000000} Disconected"
fi
