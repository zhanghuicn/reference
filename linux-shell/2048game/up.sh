#!/bin/bash

move_up() {
    local curr_index=$1
    local next_index=$((curr_index - 4))
    
    if [[ next_index -ge 0 ]] \
    && [[ arr[curr_index] -gt 0 ]] \
    && [[ arr[next_index] -eq 0 ]]; then
        arr[$next_index]=${arr[$curr_index]}
        arr[$curr_index]=0
        changed=true
        
        move_up $next_index
    fi
}

move_up_all() {
    local len=${#arr[@]}
    for (( i=0; i<len; i++))
    do
        move_up $i
    done
    
    combine_up 0
    combine_up 1
    combine_up 2
    combine_up 3
    
    for (( i=0; i<len; i++))
    do
        move_up $i
    done
}

combine_up() {
    for((i=0; i<3; i++))
    do
        local curr_index=$(($1+4*i))
        local prev_index=$((curr_index+4))
        
        if [[ arr[curr_index] -gt 0 ]] && [[ arr[curr_index] -eq arr[prev_index] ]]; then
            arr[$curr_index]=$((arr[$curr_index]*2))
            arr[$prev_index]=0
            changed=true
        fi
    done
}
