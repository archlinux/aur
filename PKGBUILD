# Maintainer: Giampaolo Mancini <giampaolo@trampolineup.com>
pypiname=begins
pkgname=python-$pypiname
pkgver=git
pkgrel=1
pkgdesc='Begins makes creating command line applications in Python easy.'
arch=('any')
url="https://pypi.python.org/pypi/$pypiname"
license=('ASL')
groups=()
depends=('python')
makedepends=('python-distribute')
source=("git+https://github.com/sh0oki/$pypiname.git")
md5sums=("SKIP")

package() {
      cd "$srcdir/$pypiname"
        python setup.py install --root="$pkgdir/" --optimize=1
    }

# vim:set ts=2 sw=2 et:
