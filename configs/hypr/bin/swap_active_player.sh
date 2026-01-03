#!/bin/bash


readarray -t SOURCES <  <( playerctl -l )

for SOURCE in "${SOURCES[@]}"; do
    echo SOURCE ${SOURCE}
    playerctl metadata --format "Now playing {{ artist }} - {{ title }}"
done

#hyprctl notify -1 10000 "rgb(ff0000)" "Dell P2722H display found $salesforce_name"
