pkgname=archchat
pkgver=0.1
pkgrel=1
pkgdesc="Minimal peer-to-peer terminal chat for Arch Linux"
arch=('any')
url="https://aur.archlinux.org/packages/archchat"
license=('MIT')
depends=('python')
source=('archchat.py')
sha256sums=('SKIP')

package() {
  install -Dm755 archchat.py "$pkgdir/usr/bin/archchat"
}

