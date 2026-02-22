#!/usr/bin/env python

# Drop-in replacement for calibre's parallel_build.py
# Avoids multiprocessing.pool.ThreadPool which triggers resource_tracker
# BrokenPipeError in chroot environments with Python 3.14+.
# Uses concurrent.futures.ThreadPoolExecutor instead, which is equally
# parallel for I/O-bound builds without any semaphore/shared-memory needs.
#
# Original: src/calibre/setup/parallel_build.py

__license__ = 'GPL v3'
__copyright__ = '2014, Kovid Goyal <kovid at kovidgoyal.net>'

import itertools
import json
import os
import shlex
import subprocess
import sys
from collections import namedtuple
from concurrent.futures import ThreadPoolExecutor
from functools import partial
from threading import Thread

from polyglot.builtins import as_bytes

Job = namedtuple('Job', 'cmd human_text cwd')

cpu_count = min(16, max(1, os.cpu_count()))


def run_worker(job, decorate=True):
    cmd, human_text = job.cmd, job.human_text
    human_text = human_text or shlex.join(cmd)
    cwd = job.cwd
    if cmd[0].lower().endswith('cl.exe'):
        cwd = os.environ.get('COMPILER_CWD')
    try:
        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, cwd=cwd)
    except Exception as err:
        return False, human_text, str(err)
    stdout, stderr = p.communicate()
    if stdout:
        stdout = stdout.decode('utf-8')
    if stderr:
        stderr = stderr.decode('utf-8')
    if decorate:
        stdout = human_text + '\n' + (stdout or '')
    ok = p.returncode == 0
    return ok, stdout, (stderr or '')


def create_job(cmd, human_text=None, cwd=None):
    return Job(cmd, human_text, cwd)


def parallel_build(jobs, log, verbose=True):
    with ThreadPoolExecutor(max_workers=cpu_count) as pool:
        for ok, stdout, stderr in pool.map(run_worker, jobs):
            if verbose or not ok:
                log(stdout)
                if stderr:
                    log(stderr)
            if not ok:
                return False
        return True


def parallel_build_silent(jobs):
    results = []
    failed = False
    with ThreadPoolExecutor(max_workers=cpu_count) as pool:
        for (ok, stdout, stderr), job in zip(pool.map(partial(run_worker, decorate=False), jobs), jobs):
            results.append((ok, job.cmd, job.human_text, stdout, stderr))
            if not ok:
                failed = True
    return failed, results


def parallel_check_output(jobs, log):
    with ThreadPoolExecutor(max_workers=cpu_count) as pool:
        for ok, stdout, stderr in pool.map(
                partial(run_worker, decorate=False), ((j, '') for j in jobs)):
            if not ok:
                log(stdout)
                if stderr:
                    log(stderr)
                raise SystemExit(1)
            yield stdout


def get_tasks(it):
    it = tuple(it)
    size, extra = divmod(len(it), cpu_count)
    if extra:
        size += 1
    it = iter(it)
    while 1:
        x = tuple(itertools.islice(it, size))
        if not x:
            return
        yield x


def batched_parallel_jobs(cmd, jobs, cwd=None):
    workers = []

    def get_output(p):
        p.output = p.communicate(as_bytes(json.dumps(p.jobs_batch)))

    for batch in get_tasks(jobs):
        p = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=cwd)
        p.jobs_batch = batch
        p.output_thread = t = Thread(target=get_output, args=(p,))
        t.daemon = True
        t.start()
        workers.append(p)

    failed = False
    ans = []
    for p in workers:
        p.output_thread.join()
        if p.wait() != 0:
            sys.stderr.buffer.write(p.output[1])
            sys.stderr.buffer.flush()
            failed = True
        else:
            ans.extend(json.loads(p.output[0]))
    if failed:
        raise SystemExit('Worker process failed')
    return ans


def threaded_func_jobs(func, jobs_args):

    def f(args):
        return func(*args)

    with ThreadPoolExecutor(max_workers=cpu_count) as pool:
        return list(pool.map(f, jobs_args))
