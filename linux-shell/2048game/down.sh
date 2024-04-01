#!/bin/bash

move_down() {
    local curr_index=$1
    local next_index=$((curr_index + 4))
    
    if [[ next_index -le 15 ]] \
    && [[ arr[next_index] -eq 0 ]] \
    && [[ arr[curr_index] -gt 0 ]]; then
        arr[$next_index]=${arr[$curr_index]}
        arr[$curr_index]=0
        changed=true
        
        move_down $next_index
    fi
}

move_down_all() {
    local len=${#arr[@]}
    
    for ((i=len-1; i>=0; i--))
    do
        move_down $i
    done
    
    combine_down 12
    combine_down 13
    combine_down 14
    combine_down 15
    
    for ((i=len-1; i>=0; i--))
    do
        move_down $i
    done
}

combine_down() {
    for((i=0; i<3; i++))
    do
        curr_index=$(($1-4*i))
        prev_index=$((curr_index-4))
        
        if [[ arr[curr_index] -gt 0 ]] && [[ arr[curr_index] -eq arr[prev_index] ]]; then
            arr[$curr_index]=$((arr[$curr_index]*2))
            arr[$prev_index]=0
            changed=true
        fi
    done
}