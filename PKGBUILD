# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=samin
_pkgname='samin'
pkgver=0.01
pkgrel=1
pkgdesc='A btrfs snapshot utility'
arch=('any')
url='https://gitlab.com/lepz0r/samin'
license=('GPL2')
depends=('python' 'python-pytz' 'btrfs-progs' 'python-tzlocal' 'python-psutil')
makedepends=('python-setuptools')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('f58a63a90c27a9a153c43269c04a4509412c6e553f3e2f214ce6cd921f29465d')

build() {
    cd "$pkgname-v$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-v$pkgver"
    python setup.py install --root="$pkgdir/"
  }
