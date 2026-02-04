# Main purpose of this config is to make work with flash drives and memory cards more adequate.

mq-deadline scheduler using IO latency as main measure, what makes it great for low IO/low concurrency devices as usb flash drives, but also, it work really well for SATA SSDs.

Another part is to reduce vfs write cache.
Write cache is not free, and overuse of RAM for it can cause low memory conditions simultaneously with IO clog.
The infamous issues with writing to USB Flash drives partially caused by write cache being to big.

Modern systems having lots of RAM (more than 8GB) what makes write cache with default settings grow inadequately large for physical storage actual write throughput. 

The is some cases when big write cache is desired, like NAS storage or some write intensive workload that at the same time is not RAM intensive.
