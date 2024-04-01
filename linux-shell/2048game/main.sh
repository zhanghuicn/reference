#!/bin/bash

arr=(0 0 2 4    0 2 4 8     2 4 8 4     4 16 64 128)
changed=false

print_arr() {
    local len=${#arr[@]}
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
            
            if [[ index%4 -eq 3 ]];then
                echo
            fi
        done
    done
}

generate() {
    local cnt=0
    local len=${#arr[@]}
    
    for ((i=0; i<len; i++))
    do
        if [[ ${arr[i]} -eq 0 ]];then
            cnt=$((cnt+1))
        fi
    done
    
    local random_num=$(($RANDOM % $cnt))
    echo "random_num" $random_num
    
    for((i=0; i < len; i++))
    do
        if [[ ${arr[i]} -eq 0 ]];then
            if [[ random_num -eq 0 ]]; then
                arr[$i]=2
                break
            fi
            
            random_num=$((random_num-1))
        fi
        
    done
}


source ./down.sh
source ./up.sh
source ./left.sh
source ./right.sh


main() {
    clear
    print_arr

    while true
    do
        read -n 1 -p "移动方向: " arrow
        if [[ $arrow == "a" ]];then
            move_left_all
            elif [[ $arrow == "d" ]];then
            move_right_all
            elif [[ $arrow == "s" ]];then
            move_down_all
            elif [[ $arrow == "w" ]];then
            move_up_all
        else
            echo "输入有误"
            continue
        fi
        
        echo "changed:" $changed
        
        if $changed; then
            generate
        fi
        
        changed=false

        print_arr
    done
}

main
