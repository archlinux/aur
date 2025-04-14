#!/bin/bash
v=76
for s in $(nm -D /lib/libicutest.so|grep " [TRD] "|awk {'print $3'}|grep _$v)
	do echo "extern void* ${s};"
	for n in {64..50}
	do
		echo "void* ${s//_$v/_$n}=&${s};"
	done
done
