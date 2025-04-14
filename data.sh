#!/bin/bash
v=76
echo "extern void* icudt${v}_dat;"
#echo "void* icudt=&icudt${v}_dat;"
for n in {64..50}
	do echo "void* icudt${n}_dat=&icudt${v}_dat;"
done
