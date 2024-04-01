#!/bin/bash

arr=(2 0 2 0 0 0 0)
len=${#arr[*]}

move_right() {
    local i
    for((i=$1; i<len-1; i++))
    do
        if [[ arr[i+1] -gt 0 ]]; then
            # 如果i+1元素大于0,则退出循环
            break
        fi
        
        arr[i+1]=${arr[i]}
        arr[i]=0
    done
}

move_right_all() {
    local i
    for ((i=len-1; i >=0; i--))
    do
        move_right $i
    done
}


echo "右移前" ${arr[@]}
move_right_all
echo "右移后" ${arr[@]}

