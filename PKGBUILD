# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=postfinger
pkgver=1.30
pkgrel=1
pkgdesc="captures Postfix configuration for reporting errors"
url="https://ftp.wl0.org/SOURCES/postfinger"
arch=('any')
license=('GPL')
#depends=("")
#optdepends=("")
source=("https://ftp.wl0.org/SOURCES/postfinger")
md5sums=('7ae1d8089869e6b883c3b338939df27d')
 
package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
