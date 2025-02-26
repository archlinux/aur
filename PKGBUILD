# Maintainer: milton <daniilgurcenkov333@gmail.com>

pkgname=femboyfetch
pkgver=1.1.6
pkgrel=1
pkgdesc="Минималистичный fetch-скрипт на Python"
arch=('any')
license=('MIT')
depends=('python' 'xorg-xrandr' 'python-psutil' 'pciutils')
source=("femboyfetch.py" "logo.txt")
md5sums=('SKIP' 'SKIP')


package() {
    install -Dm755 "$srcdir/femboyfetch.py" "$pkgdir/usr/bin/femboyfetch"
    install -Dm644 "$srcdir/logo.txt" "$pkgdir/usr/share/femboyfetch/logo.txt"
}


