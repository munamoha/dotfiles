#!/bin/bash

XRANDR=$(which xrandr)

MONITORS=( $( ${XRANDR} | awk '( $2 == "connected" ){ print $1 }' ) )

NUM_MONITORS=${#MONITORS[@]}

TITLES=()
COMMANDS=()


function gen_xrandr_only()
{
    selected=$1

    cmd="xrandr --output ${MONITORS[$selected]} --auto "

    for entry in $(seq 0 $((${NUM_MONITORS}-1)))
    do
        if [ $selected != $entry ]
        then
            cmd="$cmd --output ${MONITORS[$entry]} --off"
        fi
    done

    echo $cmd
}


# Function to generate extend commands
function gen_xrandr_extend()
{
    primary=$1
    secondary=$2
    direction=$3

    if [ "$direction" == "right" ]; then
        echo "xrandr --output ${MONITORS[$primary]} --auto --primary \
                     --output ${MONITORS[$secondary]} --auto --right-of ${MONITORS[$primary]}"
    elif [ "$direction" == "left" ]; then
        echo "xrandr --output ${MONITORS[$primary]} --auto --primary \
                     --output ${MONITORS[$secondary]} --auto --left-of ${MONITORS[$primary]}"
    fi
}


# Function to generate duplicate commands
function gen_xrandr_duplicate()
{
    primary=$1
    secondary=$2

    echo "xrandr --output ${MONITORS[$primary]} --auto --primary \
                 --output ${MONITORS[$secondary]} --auto --same-as ${MONITORS[$primary]}"
}


# Step 1: Select primary monitor
declare -a PRIMARY_OPTIONS
for entry in $(seq 0 $((${NUM_MONITORS}-1)))
do
    PRIMARY_OPTIONS+=("${MONITORS[$entry]}")
done

PRIMARY=$(printf '%s\n' "${PRIMARY_OPTIONS[@]}" | rofi -dmenu -p "Select Primary Monitor" -a 0 -no-custom)

# Find the index of the selected primary monitor
for i in "${!MONITORS[@]}"; do
    if [[ "${MONITORS[$i]}" == "$PRIMARY" ]]; then
        PRIMARY_INDEX=$i
        break
    fi
done

if [ -z "$PRIMARY_INDEX" ]; then
    echo "No primary monitor selected. Exiting."
    exit 1
fi


# Step 2: Generate extend and duplicate options for the selected primary monitor
declare -i index=0
TILES[$index]="Cancel"
COMMANDS[$index]="true"
index+=1

for entry in $(seq 0 $((${NUM_MONITORS}-1)))
do
    if [ $entry != $PRIMARY_INDEX ]
    then
        TILES[$index]="Extend to Right: ${MONITORS[$entry]}"
        COMMANDS[$index]=$(gen_xrandr_extend $PRIMARY_INDEX $entry "right")
        index+=1

        TILES[$index]="Extend to Left: ${MONITORS[$entry]}"
        COMMANDS[$index]=$(gen_xrandr_extend $PRIMARY_INDEX $entry "left")
        index+=1

        TILES[$index]="Duplicate: ${MONITORS[$entry]}"
        COMMANDS[$index]=$(gen_xrandr_duplicate $PRIMARY_INDEX $entry)
        index+=1
    fi
done

# Step 3: Add "Only Primary Monitor" option
TILES[$index]="Only ${MONITORS[$PRIMARY_INDEX]}"
COMMANDS[$index]=$(gen_xrandr_only $PRIMARY_INDEX)
index+=1


# Step 4: Generate entries for the menu
function gen_entries()
{
    for a in $(seq 0 $(( ${#TILES[@]} -1 )))
    do
        echo $a ${TILES[a]}
    done
}

# Call menu
SEL=$( gen_entries | rofi -dmenu -p "Monitor Setup" -a 0 -no-custom  | awk '{print $1}' )

# Call xrandr
$( ${COMMANDS[$SEL]} )
