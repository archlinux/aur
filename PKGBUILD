# Maintainer: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg== | base64 -d>

_binfile=dockviz_linux_amd64

pkgname=dockviz
pkgver=0.5.0
pkgrel=1
pkgdesc="Visualizing Docker Data"
arch=('x86_64')
url="https://github.com/justone/dockviz"
license=('Apache')
depends=('glibc' 'docker')
options=()
source=("$pkgname-$pkgver::https://github.com/justone/$pkgname/releases/download/v$pkgver/$_binfile")
sha1sums=('eb4d302fb83116e7b487cef0eb0bb1ffc1eb6146')

package() {
    cd "${srcdir}"
    install -Dm755 ./$pkgname-$pkgver "${pkgdir}/usr/bin/$pkgname"
}
