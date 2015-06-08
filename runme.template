#!/bin/bash
#
export KMP_AFFINITY=nowarnings,compact
 
echo -e "Edit \E[31m/etc/linpack.conf\E[37m to adjust the amount of physical memory to consume."
echo
echo -e "Starting calculation.... hit ctrl+c to stop."
echo -e "Consult \E[31m~/lin_xeon@TARGET_BIT@.txt\E[37m for results as they are caculated."

date
date >> ~/lin_xeon@TARGET_BIT@.txt
/usr/bin/xlinpack_xeon@TARGET_BIT@ /etc/linpack.conf >> ~/lin_xeon@TARGET_BIT@.txt
date >> ~/lin_xeon@TARGET_BIT@.txt
echo -n "Done: "
date
