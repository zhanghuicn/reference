#!/bin/bash

move_right() {
    local i=$1
    
    if [[ arr[i] -eq 0 ]]; then
        # 如果索引i的元素为零，则直接返回
        return
    fi
    
    local max_index=$((i/4 * 4 + 3))
    for((i=$1; i<max_index; i++))
    do
        if [[ arr[i+1] -gt 0 ]]; then
            # 如果i+1元素大于0,则退出循环
            break
        fi
        
        arr[i+1]=${arr[i]}
        arr[i]=0
    done
}

combine_right() {
    local i=0
    # $1 是行号，从0开始
    local min_index=$(($1*4)) 
    local max_index=$((max_index + 3))
    
    for ((i=max_index; i>min_index;i--))
    do
        if [[ arr[i] -gt 0 ]] \
        && [[ arr[i-1] -eq arr[i] ]]; then
            arr[i]=$((arr[i]*2))
            arr[i-1]=0
        fi
    done
}


move_right_all() {
    local len=${#arr[@]}
    local i=$((len-1))
    for ((i=len-1; i >=0; i--))
    do
        move_right $i
    done
    
    combine_right 0 #右移第0行
    combine_right 1 #右移第1行
    combine_right 2 #右移第2行
    combine_right 3 #右移第3行
    
    for ((i=len-1; i >=0; i--))
    do
        move_right $i
    done
}

