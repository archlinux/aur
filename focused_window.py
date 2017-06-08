from subprocess import run, PIPE
from json import loads, dumps
from sys import argv, exit

def root():
    process = run('i3-msg -t get_tree', shell=True, stdout=PIPE)
    return loads(process.stdout)

def focused_leaf(root):
    children = root['nodes']
    focused = root['focused']

    if not children and focused:
        return root['id']

    for n in children:
        id = focused_leaf(n)
        if id: return id

if __name__ == '__main__':
    STATUS_SUCCESS = 0
    STATUS_FAILURE = -1

    result = focused_leaf(root())
    print(dumps(result))

    exit(STATUS_SUCCESS)
