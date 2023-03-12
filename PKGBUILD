# Maintainer: Antoni Spaanderman <56turtle56@gmail.com>

pkgname=simple-usb-automount-git
pkgver=12.2bbf5dd
pkgrel=1
pkgdesc="Really simple usb storage device auto mounter"
arch=('any')
url=https://github.com/antonilol/simple-usb-automount
license=('MIT')
source=("simple-usb-automount::git+$url")
md5sums=('SKIP')
depends=('libnotify' 'sudo')
makedepends=('git')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir"/{usr/local/bin,etc/{systemd/system,udev/rules.d}}
  ./install rw "$pkgdir"
}
