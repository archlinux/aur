#!/usr/bin/env python3

# Whole script made in Vim :D

# Thanks to the people behind https://github.com/mozilla/libdmg-hfsplus
# for fixing the dmg binary!
# And of course, thanks to planetbeing for making xpwn!

import os
import subprocess
import shutil
import zipfile


if __name__ == '__main__':
    # Check build folder exists, so we can ensure cmake
    # is using correct OpenSSL version

    if os.path.exists('build'):
        shutil.rmtree('build')

    os.mkdir('build')
    os.chdir('build')

    # Begin building inside build folder

    path = '/usr/local/ssl'

    cmake_cmd = subprocess.run([
            'cmake',
            '-DOPENSSL_ROOT_DIR={}'.format(path),
            '-DOPENSSL_LIBRARIES={}/lib'.format(path),
            '..'
        ],
        stdout=subprocess.PIPE,
        universal_newlines=True
    )

    make_cmd = subprocess.run([
            'make',
            'libXPwn.a'
        ],
        subprocess.PIPE,
        universal_newlines=True
    )

    # Some reason I still get ld errors on linux and on windows,
    # though we can still build

    try:
        os.path.exists('common/libcommon.a')
        os.path.exists('ipsw-patch/libxpwn.a')
    except FileNotFoundError as error:
        print('Oof, got error:', error)
    else:
        print('Seems like we built just fine')
    finally:
        print('Do not worry if you see some errors here.', "")
        print('Also, do not send me logs/pictures of those errors,', "")
        print('I know about them.')

    print('Unzipping xpwn headers...')
    zip = zipfile.ZipFile('../xpwn-modified-headers.zip')
    zip.extractall("../headers")

    print('Ok, everything should be done!')
