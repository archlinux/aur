from subprocess import check_output

hash=check_output(['git', 'rev-parse', 'HEAD']).decode('utf-8').strip()
hashsout=check_output(['git', 'cherry', 'origin/master', 'HEAD']).decode('utf-8').rstrip('\n').split('\n')
hashs=[h[2:] for h in hashsout if h.startswith('+')]

minor = 0
bugfix = 0

for hash in hashs:
    found = False
    files=check_output(['git','diff-tree','--no-commit-id', '--name-only', '-r', hash]).decode('utf-8').rstrip('\n').split('\n')
    for file in files:
        if file.find('cef_api_hash.h') >= 0:
            found = True
            break

    if found:
        minor += 1
        bugfix = 0
    else:
        bugfix += 1
            
versions=check_output(['cat','CHROMIUM_BUILD_COMPATIBILITY.txt']).decode('utf-8').rstrip('\n').split('\n')
for line in versions:
    if line.find('chromium_checkout')!=-1:
        major=line.split('/')[-1].split('.')[0]
        chromium=line.split('/')[-1].split("'")[0]
        break


shorthash=hash[:7]

print('%s.%s.%s+g%s+chromium+%s' % (major, minor, bugfix, shorthash, chromium))