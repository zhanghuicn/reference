#!/bin/bash

arr=(2 2 4 8)
# 计算arr长度
len=${#arr[@]}

move_left() {
    local i=$1
    
    if [[ ${arr[i]} -eq 0 ]]; then
        # 如果索引i的元素为零，则直接返回
        return
    fi
    for((i=$1; i>0; i--))
    do
        if [[ ${arr[i-1]} -gt 0 ]]; then
            # 如果i-1元素大于0，则退出循环
            break
        fi
        arr[i-1]=${arr[i]}
        arr[i]=0
    done
}

combine_left() {
    local i=$((len-1))
    for ((i=1; i<len; i++))
    do
        if [[ arr[i] -gt 0 ]] \
        && [[ arr[i-1] -eq arr[i] ]]; then
            arr[i]=$((arr[i]*2))
            arr[i-1]=0
        fi
    done
}

move_left_all() {
    local i=0
    for ((i=0; i<len; i++))
    do
        move_left $i
    done
    
    combine_left
    
    for ((i=0; i<len; i++))
    do
        move_left $i
    done
}

echo "左移前" ${arr[@]}
move_left_all
echo "左移后" ${arr[@]}