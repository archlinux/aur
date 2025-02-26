# Maintainer: milton <daniilgurcenkov333@gmail.com>
pkgname=femboyfetch
pkgver=1.1.10
pkgrel=1
pkgdesc="Minimalist fetch script written in Python"
arch=('any')
license=('MIT')
depends=('python' 'xorg-xrandr' 'python-psutil' 'pciutils')
source=("femboyfetch.py" "logo.txt")
md5sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/logo.txt" "$pkgdir/usr/share/$pkgname/logo.txt"
}
