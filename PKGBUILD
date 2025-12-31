# Maintainer: Denis A. Altoe Falqueto <denisfalqueto@gmail.com>
_pkgname=yapi
pkgname=${_pkgname}-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="The API client that lives in your terminal (and your git repo)"
arch=(x86_64)
url="https://yapi.run/"
license=('MIT')
depends=('glibc')
source=("https://github.com/jamierpond/$_pkgname/releases/download/v$pkgver/${_pkgname}_linux_amd64.tar.gz")
sha256sums=('11fb2d2e8d560792085e7950fe431a90de04a89079722135a747f3a9bb4c64e5')

package() {
    mkdir -p $pkgdir/usr/bin
    cp -a yapi $pkgdir/usr/bin
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
