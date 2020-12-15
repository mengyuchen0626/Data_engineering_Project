#!/bin/bash

gnome-terminal --tab -- bash -c "docker-compose up"

while true
do
    wget -q --spider https://localhost:5000

    if [ &? -eq 0 ]; then
        echo "Online"
        break
    else
        echo "Offline"
        sleep 5
    fi
done

python app.py