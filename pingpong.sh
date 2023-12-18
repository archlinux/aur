#!/bin/bash

while true; do
    # Use the ping command to check the response time
    response_time=$(ping -c 1 8.8.8.8 | grep "time=" | cut -d' ' -f7 | cut -d'=' -f2)

    if [ -z "$response_time" ]; then
        # If response_time is empty, it means a timeout occurred
        echo "💩💩💩💩💩 Internet Outages"
    elif (( $(echo "$response_time > 150" | bc -l) )); then
        # If response_time is greater than 100 ms, print "Bad connection" message
        echo "🔴🔴🔴🔴🔴 Bad connection: ${response_time} ms"
    else
        # If response_time is less than or equal to 100 ms, print "Normal connection" message
        echo "🟢🟢🟢🟢🟢 Normal connection: ${response_time} ms"
    fi

    # Sleep for 5 seconds before the next iteration
    sleep 5
done
