#!/usr/bin/env python
import os
import sys

env = os.environ.copy()
# removing user-specific environement variables
for var in ["USER", "HOME", "LOGNAME"]:
    if var in env:
        env.pop(var)
arg_list = ["/usr/bin/pkexec", "--user", "spack", "/usr/bin/env"]
arg_list += [var + "=" + value for var, value in env.items()]
arg_list.append("/opt/spack/bin/spack")
arg_list += sys.argv[1:]
os.execv("/usr/bin/pkexec", arg_list)
