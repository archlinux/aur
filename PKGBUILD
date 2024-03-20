# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=samin-git
_pkgname='samin'
pkgver=r0.6d56d95
pkgrel=1
pkgdesc='A btrfs snapshot utility'
arch=('any')
url='https://gitlab.com/lepz0r/samin'
license=('GPL2')
depends=('python' 'python-pytz' 'btrfs-progs' 'python-tzlocal' 'python-psutil')
makedepends=('python-setuptools')
source=('git+https://gitlab.com/lepz0r/samin.git')
sha256sums=('SKIP')

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir/"
  }
