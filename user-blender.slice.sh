mem_divide_by() {
	(bc <<< "(`cat /proc/meminfo | grep ^MemTotal: | awk '{print $2}'` * 1000) * $1" | perl -pe 's/\\.[0-9]*$') || \
		exit 1
}
echo [Service]
echo MemoryMax=$(mem_divide_by 0.75)
echo MemoryHigh=$(mem_divide_by 0.66)
echo CPUQuota=75%
