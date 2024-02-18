# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Laura Demkowicz-Duffy <laura@demkowiczduffy.co.uk>
pkgname=flyingcarpet-cli
pkgver=6.0
pkgrel=1
pkgdesc="Cross-platform AirDrop"
arch=(x86_64)
url="https://github.com/spieglt/FlyingCarpet"
license=('BSD')
source=("$url/releases/download/v$pkgver/flyingcarpet_cli_linux")
noextract=("flyingcarpet_cli_linux")
md5sums=('1019ba7298571456475f1b71f88ff6be')

package() {
    install -Dm 0755 $srcdir/flyingcarpet_cli_linux $pkgdir/usr/bin/$pkgname
}
