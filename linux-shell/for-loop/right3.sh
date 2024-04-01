#!/bin/bash

arr=(2 0 0 0 0 0 2)
len=${#arr[*]}

move_right() {
    # 将i的初始值从函数参数中获取
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

echo "右移前" ${arr[@]}
move_right 0
echo "右移后" ${arr[@]}


