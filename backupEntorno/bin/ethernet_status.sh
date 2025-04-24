#!/bin/sh

echo "%{F#b71c1c} %{F#000000}$(/usr/sbin/ifconfig enp0s3 | grep "inet " | awk '{print $2}')%{u-}"
