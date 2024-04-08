#!/bin/bash

# arr=(4 2 0 0    2 0 0 2    2 0 0 2    2 0 0 2)
arr=(2 0 0 4    2 0 4 8     2 4 8 4     4 16 64 128)
len=${#arr[@]}

print_arr() {
    for ((i=0; i<4; i++))
    do
        for ((j=0; j<4; j++))
        do
            index=$((i*4+j))
            sum=$((i+j))
            
            if [[ $[sum%2] -ne 0 ]];then
                echo -ne "\033[37;46m"
            else
                echo -ne "\033[37;42m"
            fi
            
            
            if [[ ${arr[index]} -gt 0 ]];then
                printf "%-5s" "${arr[index]}"
            else
                printf "%-5s" " "
            fi
            
            echo -ne "\033[0m"
        done
        
        echo
    done
}

source ./1.right.sh


main() {
    while true
    do
        read -n 1 -p "移动方向: " arrow
        if [[ $arrow == "a" ]];then
            echo "左移"
            elif [[ $arrow == "d" ]];then
            echo "右移"
            move_right_all
            elif [[ $arrow == "s" ]];then
            echo "下移"
            elif [[ $arrow == "w" ]];then
            echo "上移"
        else
            echo "输入有误"
            continue
        fi
        
        print_arr
    done
}

main