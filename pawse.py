#!/usr/bin/env python3

path_ = "/home/froggo/.cache/pawse"

import sys, subprocess, os, psutil, json
from pathlib import Path
from multiprocessing import Process as mp_proc
from io import TextIOWrapper

alias = {
  'help':       ['help', '--help', 'h', '-h'],
  'create':     ['create', '--create', 'c', '-c'],
  'join':       ['join', '--join', 'j', '-j'],
  'kill':       ['kill', '--kill', 'k', '-k'],
  'restart':    ['restart', '--restart', 'r', '-r'],
  'isrunning':  ['isrunning', '--isrunning', 'i', '-i']
}

all_cmd = []
for cmd in alias.keys():
  all_cmd += alias[cmd]

for arg in sys.argv:
  if arg in all_cmd:
    sys.argv = sys.argv[sys.argv.index(arg):]

if sys.argv == []:
  sys.argv = ['help']

def read_stdout(name):
  cache = 0
  while True:
    try:
      p_stdout = open(f'{path_}/{name}.stdout', 'r')
    except FileNotFoundError:
      sys.exit()
    try:
      sys.stdout.write(list(p_stdout)[cache])
      cache += 1
    except IndexError:
      pass
    p_stdout.close()

def rm_silent(f):
  try:
    os.remove(f)
  except FileNotFoundError:
    pass

def cleanup(name):
  rm_silent(f'{path_}/{name}.stdin')
  rm_silent(f'{path_}/{name}.stdout')
  rm_silent(f'{path_}/{name}.pid')


# def pawse_stdin_gen(name):
#   class pawse_stdin():#TextIOWrapper):
#     def __init__():
#       open(f'{path_}/{name}.stdin', 'w')
#     def read():
#       f = open(f'{path_}/{name}.stdin')
#       data = f.read()
#       f.close()
#       return data
#     def fileno():
#       return 0
#   return pawse_stdin

def cmda(a):
  return sys.argv[0] in alias[a]

commands = {}

def assign(arg):
  def assign_func(l):
    commands[arg] = l
  return assign_func







@assign('help')
def help():
  print('')

@assign('create')
def create(name = sys.argv[1], cmdlineargs = sys.argv[2:]):
  cleanup(name)
  Path(f'{path_}/{name}.stdin').touch()

  p_stdout = open(f'{path_}/{name}.stdout', 'a')
  #p_stdin  = open(f'{path_}/{name}.stdin') #pawse_stdin_gen(name)

  open(f'{path_}/{name}.pid', 'w').write(str(subprocess.Popen(['bash', '-c', f'{" ".join(cmdlineargs)} < <(tail -f {path_}/{name}.stdin)'], stdout=p_stdout, stderr=p_stdout).pid))
  open(f'{path_}/{name}.sh', 'w').write(json.dumps(cmdlineargs))
 # sys.exit()

@assign('join')
def join(name = sys.argv[1]):
  try:    
    if not Path(f'{path_}/{name}.stdin').exists():
      print(f"No process named '{name}'.")
      sys.exit()

    p = mp_proc(target=read_stdout, args=(name,))
    p.daemon = True

    print('Connected to pawse process\n-----')

    p.start()
    for l in sys.stdin:
      p_stdin  = open(f'{path_}/{name}.stdin', 'a')
      p_stdin.write(l)
      p_stdin.close()
      #print('>> ', end='')
      #print(f'>> {l}')
  except KeyboardInterrupt:
    print('\n\nDisconnected from pawse process')
    sys.exit()

@assign('kill')
def kill(name = sys.argv[1]):
  try:
    subprocess.Popen(['kill', open(f'{path_}/{name}.pid').read()])
  except FileNotFoundError:
    pass
  if not commands['isrunning'](name):
    cleanup(name)
  print("The pawse process has been terminated.")

@assign('restart')
def restart(name = sys.argv[1]):
  try:
    claf = open(f'{path_}/{name}.sh')
    cla = json.loads(claf.read())
    claf.close()
    commands['kill'](name)
    if not commands['isrunning'](name):
      commands['create'](name, cla)
      print(f"Pawse process '{name}' ('{' '.join(cla)}') restarted sucessfully.")
      return
    print(f"Pawse process '{name}' ('{' '.join(cla)}') didn't terminate.")
  except Exception as e:
    print(e)

@assign('isrunning')
def isrunning(name = sys.argv[1]):
  o = True
  pid = None
  try:
    pidf = open(f'{path_}/{name}.pid')
    pid = int(pidf.read())
    pidf.close()
    psutil.Process(pid)
  except (FileNotFoundError, psutil.NoSuchProcess):
    o = False
    cleanup(name)
  
  print([f"Pawse process '{name}' is not running.", f"Pawse process '{name}' is running with PID {pid}."][o])
  return o



r = True
if sys.argv[0] not in all_cmd:
  print(f"Unexpected command '{sys.argv[0]}'. Type 'pawse help' for help.")
  r = False
for x in commands.keys():
  if cmda(x) and r:
    commands[x]()
    r = False





