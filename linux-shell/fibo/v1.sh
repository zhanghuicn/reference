#!/bin/bash

n=$1

fibo=(1 1)

for ((i=2; i<=n; i++))
do
    fibo[i]=$((fibo[i-1]+fibo[i-2]))
done

echo "result=" ${fibo[$n]}

