# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>

pkgname=flyingcarpet-cli
pkgver=6.0
pkgrel=2
pkgdesc="Cross-platform AirDrop"
arch=(x86_64)
url="https://github.com/spieglt/FlyingCarpet"
license=('BSD-3-Clause')
depends=('glibc')
source=("$url/releases/download/v$pkgver/flyingcarpet_cli_linux")
noextract=("flyingcarpet_cli_linux")
md5sums=('1019ba7298571456475f1b71f88ff6be')

package() {
    install -Dm 0755 $srcdir/flyingcarpet_cli_linux $pkgdir/usr/bin/$pkgname
}
