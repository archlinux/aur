# Maintainer: Kazumi dima.burak1811@gmail.com
pkgname=gubamifetch
pkgver=1.0
pkgrel=1
pkgdesc="A fancy system fetch script with gubami-style logo"
arch=('any')
url="https://github.com/retroover/Gubamifetch"
license=('MIT')
depends=('xorg-xrandr' 'lsb-release' 'pciutils' 'inetutils' 'procps-ng' 'python')
source=("https://github.com/retroover/Gubamifetch/raw/main/gubamifetch.py")
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/gubamifetch.py" "$pkgdir/usr/bin/gubamifetch"
}
