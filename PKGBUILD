pkgname=cfetch
pkgver=1.0.2
pkgrel=1
pkgdesc="A shitty fetch written in C99"
arch=('x86_64')
url="https://github.com/ItzAfroBoy/cfetch"
license=('GPL3')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6cdbd1eeb3b705615a20c261631a4ac000c1f09b723ef076df4b02410ef5f246')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
}
