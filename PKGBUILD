# Maintainer: Ouyang Jun <ouyangjun1999@gmail.com>

pkgname=pm-flashtool
pkgver=0.1
pkgrel=1
pkgdesc="Tool for Flashing PM as LXC Container on top of CM"
arch=('any')
url="https://github.com/plasma-phone-packaging/pm-flashtool"
license=('GPL2')
makedepends=("git")
depends=("bash")
source=("$pkgname::git+https://github.com/plasma-phone-packaging/pm-flashtool.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  install -Dm 755 flash-multirom "$pkgdir/usr/bin/flash-multirun"
  install -Dm 755 pm-flash "$pkgdir/usr/bin/pm-flash"
}

