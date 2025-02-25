# Maintainer: milton <daniilgurcenkov333@gmail.com>

pkgname=femboyfetch
pkgver=1.1.2
pkgrel=1
pkgdesc="Минималистичный fetch-скрипт на Python"
arch=('any')
license=('MIT')
depends=('python' 'xorg-xrandr' 'python-psutil' 'pciutils')
source=("femboyfetch.py")
md5sums=('SKIP')


package() {
  install -Dm755 "$srcdir/femboyfetch.py" "$pkgdir/usr/bin/femboyfetch/femboyfetch"
  install -Dm755 "$srcdir/logo.txt" "$pkgdir/usr/bin/femboyfetch/logo.txt"
}

