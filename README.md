# linux-raspberrypi4-cacule-PKGBUILD

## PKGBUILD for archlinuxarm with the cacule schedeuler.

So far no perfomance/improvements tests done. Should work with desktop usage with a much better responsivty. 
On x86_64 its one of the best schedeulers i have ever used. 

The patch can be applied for armv7 and armv8. You can use Cacule and Cacule-RDB. Cacule-RDB is still a expermintal thing. 

## Informations to Cacule-RDB

This is an experimental load balancer for Cachy/CacULE. It is a lightweight
load balancer which is a replacement of CFS load balancer. It migrates
tasks based on their HRRN/Interactivity Scores (IS). Most of CFS load balancing-related
updates (cfs and se updates loads) are removed. The RDB balancer follows CFS
paradigm in which RDB balancing happen at the same points CFS does. RDB balancing happens
in three functions: newidle_balance, idle_balance, and active_balance. The newidle_balance
is called exactly at the same time as CFS did (when pick next task fails to find any task to run).
The RDB newidle_balance pulls one task that is the highest HRRN/IS from any CPU. The RDB idle_balance
is called in trigger_load_balance when CPU is idle, it does the same as newidle_balance but with
slight changes since newidle_balance is a special case. The RDB active_balance checks if the current
(NORMAL) runqueue has one task, if so, it pulls the highest of the highest HRRN/IS among all other CPUS. If the
runqueue has more than one task, then it pulls any highest HRRN/IS (same as idle does). A CPU cannot pull a task
from another CPU that has fewer tasks (when pull any). For the all three balancing
newidle_balance, idle_balance, and active_balance, the cpu first tries to pull from a CPU that shares the same
cache (cpus_share_cache). If can't pull any then it tries to pull from any CPU even though they are not in the same core.
Only when pulling the highest of the highest HRRN/IS (i.e. active_balance when CPU has one task), there is no check for
shared cache.

Since trigger_load_balance is called for every tick, there is a guard time to prevent frequent tasks migration to reduce
runqueues locking and to reduce unnecessary tasks migrations. The time is 3ms after each active_balance. This time
guard is specifically for HZ=5 
0,1000. We don't want to run balancing every 2ms or 1ms to prevent regression in performance.
Here is how frequent the trigger_load_balance would run balancer with given HZ values:

- HZ=100 runs every ~10ms
- HZ=250 runs every ~4ms
- HZ=300 runs every ~3ms
- HZ=500 runs every ~4ms
- HZ=1000 runs every ~3ms


### How to compile it 

    git clone https://github.com/ptr1337/linux-raspberrypi4-cacule.git
    cd linux-raspberrypi4-cacule
    Then remove in the PKGBUILD if building for ***aarch64*** the 32-bit-converter.patch also the md5
    If you decide to use it without the RDB you need to remove in the config CONFIG_CACULE_RDB=y
    then compile it with makepkg -si
    

reboot your device. 

## Cacule Schedeuler Informations

https://github.com/hamadmarri/cacule-cpu-scheduler
