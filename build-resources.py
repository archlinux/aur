#!/usr/bin/env python3
"""Choose conservative Firefox build concurrency from current Linux resources."""

import math
import os
from pathlib import Path
import sys

GIB = 1024**3


def read_number(path):
    try:
        return int(path.read_text().strip())
    except (OSError, ValueError):
        return None


def available_resources():
    cpus = len(os.sched_getaffinity(0))
    fields = dict(line.split(':', 1) for line in Path('/proc/meminfo').read_text().splitlines())
    memory = int(fields.get('MemAvailable', fields['MemFree']).split()[0]) * 1024
    for line in Path('/proc/self/cgroup').read_text().splitlines():
        hierarchy, controllers, relative = line.split(':', 2)
        if hierarchy != '0' or controllers:
            continue
        root = Path('/sys/fs/cgroup')
        current = root / relative.lstrip('/')
        while current.is_relative_to(root):
            limit = read_number(current / 'memory.max')
            used = read_number(current / 'memory.current')
            if limit is not None and used is not None:
                memory = min(memory, max(0, limit - used))
            try:
                quota, period = (current / 'cpu.max').read_text().split()
                if quota != 'max':
                    cpus = min(cpus, max(1, math.ceil(int(quota) / int(period))))
            except (OSError, ValueError):
                pass
            current = current.parent
    return cpus, memory


def job_limit(name, automatic):
    value = os.environ.get(name)
    if value is None:
        return automatic
    if not value.isascii() or not value.isdecimal() or int(value) < 1:
        raise ValueError(f'{name} must be a positive integer')
    return min(automatic, int(value))


def plan(cpus, memory):
    # Leave headroom for the desktop and memory-heavy individual compiler jobs.
    budget = max(0, memory - max(GIB, memory // 5))
    compile_jobs = job_limit('FIREFOX_VRR_JOBS', max(1, min(cpus, budget // (3 * GIB // 2))))
    link_jobs = job_limit('FIREFOX_VRR_LTO_JOBS', max(1, min(compile_jobs, budget // (3 * GIB))))
    return compile_jobs, link_jobs


def main():
    cpus, memory = available_resources()
    try:
        jobs, links = plan(cpus, memory)
    except ValueError as error:
        sys.exit(str(error))
    print(jobs, links, memory // (1024**2), cpus)


if __name__ == '__main__':
    main()
