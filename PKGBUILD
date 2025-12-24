# Maintainer: Denis A. Altoe Falqueto <denisfalqueto@gmail.com>
_pkgname=yapi
pkgname=${_pkgname}-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="The API client that lives in your terminal (and your git repo)"
arch=(x86_64)
url="https://yapi.run/"
license=('MIT')
depends=('glibc')
source=("https://github.com/jamierpond/$_pkgname/releases/download/v$pkgver/${_pkgname}_linux_amd64.tar.gz")
sha256sums=('e5cbf0fd60923a883bbd6f1843e9df33f63a76e6188525159d7809c855350b71')

package() {
    mkdir -p $pkgdir/usr/bin
    cp -a yapi $pkgdir/usr/bin
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
