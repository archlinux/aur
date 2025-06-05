#!/usr/bin/env python3

######################
import os, subprocess
import argparse
import time

############################################################################################################
def defineArgs():
    parser = argparse.ArgumentParser(description="Continuously watch and display the output of a command.")

    parser.add_argument(
        "-c", "--command",
        type=str,
        default='printf "Default \\"cwatch\\" command.\nCommand test, using \\"date\\" command within \\"printf\\":\n\n$(date)"',
        help="The command to execute and watch."
    )
    parser.add_argument(
        "-i", "--interval",
        type=float,
        default=1.0, # Default interval in seconds
        help="Time interval between command executions (in seconds, default: 1.0)."
    )
    parser.add_argument(    
        "-d", "--dClear",
        action="store_true", # Makes it a boolean flag, True if present, False otherwise
        help="Don't clear the screen before each command output."
    )

    return parser.parse_args()

def captureCommandOutput(command):
    output = subprocess.run(
        ['script', '-qec', command, '/dev/null'],
        capture_output=True,
        text=True,
        check=True
    )
    return output.stdout

#################################
args = defineArgs()

command = args.command
interval = args.interval
clear = args.dClear

if clear == True:
    clear = False

else:
    clear = True

output = ""
error = ""

############################################################
while True: 
    try:
        output = captureCommandOutput(command)
        error = ""

    except Exception as errorCode:
        error = f"\nError for this iteration: {errorCode}\n"

    if clear:
        os.system("clear")

    print(output)
    print(error, end="")
    time.sleep(interval)
