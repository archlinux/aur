# Maintainer: Archean <1091876908@qq.com>
pkgname=foru
pkgver=1.0.0
pkgrel=1
pkgdesc="A unofficial client of spotify based on electron & react"
url="https://github.com/Archean-wang/ForU"
arch=("x86_64")
license=('MIT')
source=("https://github.com/Archean-wang/ForU/releases/download/v${pkgver}/foru_${pkgver}_amd64.deb")
sha512sums=('13cc7a11636fa2656c16b151ef0c7640338cab868c6bbf84377b6f8a055a7d465dc855d7aed92525bde4cfca5ec06d8aaf9cb3e1ce0ea9d2488ce1cb7c4155b5')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "$pkgdir"/opt/$pkgname/resources/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
