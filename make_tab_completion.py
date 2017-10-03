# Create tab completion for Nikola
# Hacky, I know. Can't do better.
import sys
import os
import glob
from io import StringIO

print('Creating tab completion...')
try:
    sys.path.extend(glob.glob(os.environ['pkgdir'] + '/usr/lib/python*/site-packages'))
    sys.argv[0] = 'nikola'
    import nikola.__main__
    from nikola.utils import makedirs
    nikola.__main__._RETURN_DOITNIKOLA = True
    dn = nikola.__main__.main()
    dn.nikola.init_plugins(commands_only=True)
    cmds = dn.get_cmds()
    tabcompletion = cmds['tabcompletion'](task_loader=dn.task_loader, cmds=cmds, config=dn.config)
    bash_io = StringIO()
    zsh_io = StringIO()
    tabcompletion.outstream = bash_io
    tabcompletion.execute({'shell': 'bash', 'hardcode_tasks': False}, [])
    tabcompletion.outstream = zsh_io
    tabcompletion.execute({'shell': 'zsh', 'hardcode_tasks': False}, [])

    bash = bash_io.getvalue()
    zsh = zsh_io.getvalue()

    bashdir = os.environ['pkgdir'] + '/usr/share/bash-completion/completions/'
    zshdir = os.environ['pkgdir'] + '/usr/share/zsh/site-functions/'

    bashfile = bashdir + 'nikola'
    zshfile = zshdir + '_nikola'

    makedirs(bashdir)
    makedirs(zshdir)

    with open(bashfile, 'w') as fh:
        fh.write(bash)

    with open(zshfile, 'w') as fh:
        fh.write(zsh)

    os.chmod(bashfile, 0o755)
    os.chmod(zshfile, 0o755)
    print('Tab completion created successfully.')
except Exception as e:
    print('Creating tab completion failed.')
    print(e)
