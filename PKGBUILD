# Maintainer: M-ARTS <mxmerts33@gmail.com>
pkgname=open-meb
pkgver=1.0.0
pkgrel=1
pkgdesc="Arch Linux tabanlı sistemler için MEB sertifika yöneticisi"
arch=('any')
url="https://github.com/mx-merts/OPEN-MEB"
license=('MIT')
depends=('openssl' 'wget')
source=("open-meb::https://raw.githubusercontent.com/mx-merts/OPEN-MEB/main/open-meb")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/open-meb" "$pkgdir/usr/local/bin/open-meb"
}
