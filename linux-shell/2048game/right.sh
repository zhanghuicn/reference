#!/bin/bash

move_right() {
    local curr_index=$1
    local next_index=$((curr_index+1))
    
    if [[ curr_index%4 -lt 3 ]] \
    && [[ arr[curr_index] -gt 0 ]] \
    && [[ arr[next_index] -eq 0 ]]; then
        arr[$next_index]=${arr[$curr_index]}
        arr[$curr_index]=0
        changed=true
        
        move_right $next_index
    fi
}

combine_right() {
    for((i=0; i<3; i++))
    do
        curr_index=$(($1-i))
        prev_index=$((curr_index-1))
        
        if [[ arr[curr_index] -gt 0 ]] && [[ arr[curr_index] -eq arr[prev_index] ]]; then
            arr[$curr_index]=$((arr[$curr_index]*2))
            arr[$prev_index]=0
            changed=true
        fi
    done
}

move_right_all() {
    local len=${#arr[@]}
    for ((i=len-1; i>=0; i--))
    do
        move_right $i
    done
    
    combine_right 3
    combine_right 7
    combine_right 11
    combine_right 15
    
    for ((i=len-1; i>=0; i--))
    do
        move_right $i
    done
}