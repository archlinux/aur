#!/usr/bin/env python3

import psutil

def get_battery_level():
    battery = psutil.sensors_battery()
    percent = battery.percent
    plugged = battery.power_plugged
    status = "Plugged In" if plugged else "Not Plugged In"
    return percent, status

def main():
    percent, status = get_battery_level()
    print(f"Battery Level: {percent}% ({status})")

if __name__ == "__main__":
    main()
