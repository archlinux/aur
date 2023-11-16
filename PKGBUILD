# Maintainer: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg== | base64 -d>

_binfile=dockviz_linux_amd64

pkgname=dockviz
pkgver=0.6.4
pkgrel=1
pkgdesc="Visualizing Docker Data"
arch=('x86_64')
url="https://github.com/justone/dockviz"
license=('Apache')
depends=('glibc' 'docker')
options=()
source=("$pkgname-$pkgver::https://github.com/justone/$pkgname/releases/download/v$pkgver/$_binfile")
sha1sums=('2c97682442bd4bf689333cab1ee558d82fac410f')

package() {
    cd "${srcdir}"
    install -Dm755 ./$pkgname-$pkgver "${pkgdir}/usr/bin/$pkgname"
}
