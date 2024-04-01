#!/bin/bash

move_left() {
    local curr_index=$1
    local next_index=$((curr_index-1))
    
    if [[ curr_index%4 -gt 0 ]] \
    && [[ arr[curr_index] -gt 0 ]] \
    && [[ arr[next_index] -eq 0 ]]; then
        arr[$next_index]=${arr[$curr_index]}
        arr[$curr_index]=0
        changed=true
        
        move_left $next_index
    fi
}

combine_left() {
    curr_index=$1
    for((i=0; i<3; i++))
    do
        curr_index=$(($1+i))
        prev_index=$((curr_index+1))
        
        if [[ arr[curr_index] -gt 0 ]] && [[ arr[curr_index] -eq arr[prev_index] ]]; then
            arr[$curr_index]=$((arr[$curr_index]*2))
            arr[$prev_index]=0
            changed=true
        fi
    done
}

move_left_all() {
    local len=${#arr[@]}
    for ((i=0; i<len; i++))
    do
        move_left $i
    done
    
    combine_left 0
    combine_left 4
    combine_left 8
    combine_left 12
    
    for ((i=0; i<len; i++))
    do
        move_left $i
    done
}
