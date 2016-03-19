#!/bin/bash
#
# NodeQuery Agent
#
# @version		0.7.7
# @date			2014-07-30
# @copyright	(c) 2014 http://nodequery.com
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Set environment
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Agent version
version="0.7.7"

# Authentication required
if [ -f /etc/nodequery/nq-auth.log ]
then
	auth=($(cat /etc/nodequery/nq-auth.log))
else
	echo "Error: Authentication log is missing."
	exit 1
fi

# Prepare values
function prep ()
{
	echo "$1" | sed -e 's/^ *//g' -e 's/ *$//g' | sed -n '1 p'
}

# Base64 values
function base ()
{
	echo "$1" | tr -d '\n' | base64 | tr -d '=' | tr -d '\n' | sed 's/\//%2F/g' | sed 's/\+/%2B/g'
}

# Integer values
function int ()
{
	echo ${1/\.*}
}

# Filter numeric
function num ()
{
	case $1 in
	    ''|*[!0-9\.]*) echo 0 ;;
	    *) echo $1 ;;
	esac
}

# Agent version
version=$(prep "$version")

# System uptime
uptime=$(prep $(int "$(cat /proc/uptime | awk '{ print $1 }')"))

# Login session count
sessions=$(prep "$(who | wc -l)")

# Process count
processes=$(prep "$(ps axc | wc -l)")

# Process array
processes_array="$(ps axc -o uname:12,pcpu,rss,cmd --sort=-pcpu,-rss --noheaders --width 120)"
processes_array="$(echo "$processes_array" | grep -v " ps$" | sed 's/ \+ / /g' | sed '/^$/d' | tr "\n" ";")"

# File descriptors
file_handles=$(prep $(num "$(cat /proc/sys/fs/file-nr | awk '{ print $1 }')"))
file_handles_limit=$(prep $(num "$(cat /proc/sys/fs/file-nr | awk '{ print $3 }')"))

# OS details
os_kernel=$(prep "$(uname -r)")

if ls /etc/*release > /dev/null 2>&1
then
	os_name=$(prep "$(cat /etc/*release | grep '^PRETTY_NAME=\|^NAME=\|^DISTRIB_ID=' | awk -F\= '{ print $2 }' | tr -d '"' | tac)")
fi

if [ -z "$os_name" ]
then
	if [ -e /etc/redhat-release ]
	then
		os_name=$(prep "$(cat /etc/redhat-release)")
	elif [ -e /etc/debian_version ]
	then
		os_name=$(prep "Debian $(cat /etc/debian_version)")
	fi
	
	if [ -z "$os_name" ]
	then
		os_name=$(prep "$(uname -s)")
	fi
fi

case $(uname -m) in
x86_64)
	os_arch=$(prep "x64")
	;;
i*86)
	os_arch=$(prep "x86")
	;;
*)
	os_arch=$(prep "$(uname -m)")
	;;
esac

# CPU details
cpu_name=$(prep "$(cat /proc/cpuinfo | grep 'model name' | awk -F\: '{ print $2 }')")
cpu_cores=$(prep "$(($(cat /proc/cpuinfo | grep 'model name' | awk -F\: '{ print $2 }' | sed -e :a -e '$!N;s/\n/\|/;ta' | tr -cd \| | wc -c)+1))")

if [ -z "$cpu_name" ]
then
	cpu_name=$(prep "$(cat /proc/cpuinfo | grep 'vendor_id' | awk -F\: '{ print $2 } END { if (!NR) print "N/A" }')")
	cpu_cores=$(prep "$(($(cat /proc/cpuinfo | grep 'vendor_id' | awk -F\: '{ print $2 }' | sed -e :a -e '$!N;s/\n/\|/;ta' | tr -cd \| | wc -c)+1))")
fi

cpu_freq=$(prep "$(cat /proc/cpuinfo | grep 'cpu MHz' | awk -F\: '{ print $2 }')")

if [ -z "$cpu_freq" ]
then
	cpu_freq=$(prep $(num "$(lscpu | grep 'CPU MHz' | awk -F\: '{ print $2 }' | sed -e 's/^ *//g' -e 's/ *$//g')"))
fi

# RAM usage
ram_total=$(prep $(num "$(cat /proc/meminfo | grep ^MemTotal: | awk '{ print $2 }')"))
ram_free=$(prep $(num "$(cat /proc/meminfo | grep ^MemFree: | awk '{ print $2 }')"))
ram_cached=$(prep $(num "$(cat /proc/meminfo | grep ^Cached: | awk '{ print $2 }')"))
ram_buffers=$(prep $(num "$(cat /proc/meminfo | grep ^Buffers: | awk '{ print $2 }')"))
ram_usage=$((($ram_total-($ram_free+$ram_cached+$ram_buffers))*1024))
ram_total=$(($ram_total*1024))

# Swap usage
swap_total=$(prep $(num "$(cat /proc/meminfo | grep ^SwapTotal: | awk '{ print $2 }')"))
swap_free=$(prep $(num "$(cat /proc/meminfo | grep ^SwapFree: | awk '{ print $2 }')"))
swap_usage=$((($swap_total-$swap_free)*1024))
swap_total=$(($swap_total*1024))

# Disk usage
disk_total=$(prep $(num "$(($(df -P -B 1 | grep '^/' | awk '{ print $2 }' | sed -e :a -e '$!N;s/\n/+/;ta')))"))
disk_usage=$(prep $(num "$(($(df -P -B 1 | grep '^/' | awk '{ print $3 }' | sed -e :a -e '$!N;s/\n/+/;ta')))"))

# Disk array
disk_array=$(prep "$(df -P -B 1 | grep '^/' | awk '{ print $1" "$2" "$3";" }' | sed -e :a -e '$!N;s/\n/ /;ta' | awk '{ print $0 } END { if (!NR) print "N/A" }')")

# Active connections
if [ -n "$(command -v ss)" ]
then
	connections=$(prep $(num "$(ss -tun | tail -n +2 | wc -l)"))
else
	connections=$(prep $(num "$(netstat -tun | tail -n +3 | wc -l)"))
fi

# Network interface
nic=$(prep "$(ip route get 8.8.8.8 | grep dev | awk -F'dev' '{ print $2 }' | awk '{ print $1 }')")

if [ -z $nic ]
then
	nic=$(prep "$(ip link show | grep 'eth[0-9]' | awk '{ print $2 }' | tr -d ':')")
fi

# IP addresses and network usage
ipv4=$(prep "$(ip addr show $nic | grep 'inet ' | awk '{ print $2 }' | awk -F\/ '{ print $1 }' | grep -v '^127' | awk '{ print $0 } END { if (!NR) print "N/A" }')")
ipv6=$(prep "$(ip addr show $nic | grep 'inet6 ' | awk '{ print $2 }' | awk -F\/ '{ print $1 }' | grep -v '^::' | grep -v '^0000:' | grep -v '^fe80:' | awk '{ print $0 } END { if (!NR) print "N/A" }')")

if [ -d /sys/class/net/$nic/statistics ]
then
	rx=$(prep $(num "$(cat /sys/class/net/$nic/statistics/rx_bytes)"))
	tx=$(prep $(num "$(cat /sys/class/net/$nic/statistics/tx_bytes)"))
else
	rx=$(prep $(num "$(ip -s link show $nic | grep '[0-9]*' | grep -v '[A-Za-z]' | awk '{ print $1 }' | sed -n '1 p')"))
	tx=$(prep $(num "$(ip -s link show $nic | grep '[0-9]*' | grep -v '[A-Za-z]' | awk '{ print $1 }' | sed -n '2 p')"))
fi

# Average system load
load=$(prep "$(cat /proc/loadavg | awk '{ print $1" "$2" "$3 }')")

# Detailed system load calculation
time=$(date +%s)
stat=($(cat /proc/stat | head -n1 | sed 's/[^0-9 ]*//g' | sed 's/^ *//'))
cpu=$((${stat[0]}+${stat[1]}+${stat[2]}+${stat[3]}))
io=$((${stat[3]}+${stat[4]}))
idle=${stat[3]}

if [ -e /etc/nodequery/nq-data.log ]
then
	data=($(cat /etc/nodequery/nq-data.log))
	interval=$(($time-${data[0]}))
	cpu_gap=$(($cpu-${data[1]}))
	io_gap=$(($io-${data[2]}))
	idle_gap=$(($idle-${data[3]}))
	
	if [[ $cpu_gap > "0" ]]
	then
		load_cpu=$(((1000*($cpu_gap-$idle_gap)/$cpu_gap+5)/10))
	fi
	
	if [[ $io_gap > "0" ]]
	then
		load_io=$(((1000*($io_gap-$idle_gap)/$io_gap+5)/10))
	fi
	
	if [[ $rx > ${data[4]} ]]
	then
		rx_gap=$(($rx-${data[4]}))
	fi
	
	if [[ $tx > ${data[5]} ]]
	then
		tx_gap=$(($tx-${data[5]}))
	fi
fi

# System load cache
echo "$time $cpu $io $idle $rx $tx" > /etc/nodequery/nq-data.log

# Prepare load variables
rx_gap=$(prep $(num "$rx_gap"))
tx_gap=$(prep $(num "$tx_gap"))
load_cpu=$(prep $(num "$load_cpu"))
load_io=$(prep $(num "$load_io"))

# Get network latency
ping_eu=$(prep $(num "$(ping -c 2 -w 2 ping-eu.nodequery.com | grep rtt | cut -d'/' -f4 | awk '{ print $3 }')"))
ping_us=$(prep $(num "$(ping -c 2 -w 2 ping-us.nodequery.com | grep rtt | cut -d'/' -f4 | awk '{ print $3 }')"))
ping_as=$(prep $(num "$(ping -c 2 -w 2 ping-as.nodequery.com | grep rtt | cut -d'/' -f4 | awk '{ print $3 }')"))

# Build data for post
data_post="token=${auth[0]}&data=$(base "$version") $(base "$uptime") $(base "$sessions") $(base "$processes") $(base "$processes_array") $(base "$file_handles") $(base "$file_handles_limit") $(base "$os_kernel") $(base "$os_name") $(base "$os_arch") $(base "$cpu_name") $(base "$cpu_cores") $(base "$cpu_freq") $(base "$ram_total") $(base "$ram_usage") $(base "$swap_total") $(base "$swap_usage") $(base "$disk_array") $(base "$disk_total") $(base "$disk_usage") $(base "$connections") $(base "$nic") $(base "$ipv4") $(base "$ipv6") $(base "$rx") $(base "$tx") $(base "$rx_gap") $(base "$tx_gap") $(base "$load") $(base "$load_cpu") $(base "$load_io") $(base "$ping_eu") $(base "$ping_us") $(base "$ping_as")"

# API request with automatic termination
if [ -n "$(command -v timeout)" ]
then
	timeout -s SIGKILL 30 wget -q -o /dev/null -O /etc/nodequery/nq-agent.log -T 25 --post-data "$data_post" --no-check-certificate "https://nodequery.com/api/agent.json"
else
	wget -q -o /dev/null -O /etc/nodequery/nq-agent.log -T 25 --post-data "$data_post" --no-check-certificate "https://nodequery.com/api/agent.json"
	wget_pid=$! 
	wget_counter=0
	wget_timeout=30
	
	while kill -0 "$wget_pid" && (( wget_counter < wget_timeout ))
	do
	    sleep 1
	    (( wget_counter++ ))
	done
	
	kill -0 "$wget_pid" && kill -s SIGKILL "$wget_pid"
fi

# Finished
exit 1
