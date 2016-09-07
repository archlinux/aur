# Maintainer: Giampaolo Mancini <giampaolo@trampolineup.com>
pypiname=begins
pkgname=python-$pypiname
pkgver=0.9
pkgrel=1
pkgdesc='Begins makes creating command line applications in Python easy.'
arch=('any')
url="https://pypi.python.org/pypi/$pypiname"
license=('ASL')
groups=()
depends=('python')
makedepends=('python-distribute')
source=("https://github.com/aliles/$pypiname/archive/$pkgver.tar.gz")
md5sums=('db4d5aea6d0809e5118db87225a9607c')

package() {
      cd "$srcdir/$pypiname-$pkgver"
        python setup.py install --root="$pkgdir/" --optimize=1
    }

# vim:set ts=2 sw=2 et:
