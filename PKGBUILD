# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=postfinger
pkgver=1.31
pkgrel=1
pkgdesc="captures Postfix configuration for reporting errors"
#url="https://ftp.wl0.org/SOURCES/postfinger"
url="https://github.com/ford--prefect/postfinger"
arch=('any')
license=('GPL')
#depends=("")
#optdepends=("")
#source=("https://ftp.wl0.org/SOURCES/postfinger")
source=("https://github.com/ford--prefect/postfinger/raw/main/postfinger")
md5sums=('a3ca48ba2d871be42663437bf6c1203e')
 
package() {
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
