#!/bin/sh
# Signal that the unmounting process is complete by writing to the named pipe
echo exit > /exit.fifo
