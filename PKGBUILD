# Maintainer: Jerry Ron Sunny <jerryronsunny@proton.me>
pkgname=notifyme
pkgver=1.0
pkgrel=1
pkgdesc="A simple Python tool to send Linux notifications at a given time"
arch=('any')
url="https://aur.archlinux.org/packages/notifyme"
license=('MIT')
depends=('python' 'libnotify')
source=("notifyme.py")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/notifyme.py" "$pkgdir/usr/bin/notifyme"
}

