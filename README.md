# nvidia-driver-fixer

The problem: `/dev/nvidiactl` does not exist after booting. The solution: Run `nvidia-smi` and some magic happens and the device file gets created.

This is useful for docker containers which require hardware acceleration.

This is a bad workaround. DO NOT USE IN PROD!!!
