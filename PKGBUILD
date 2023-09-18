# Maintainer: Archean <1091876908@qq.com>
pkgname=foru
pkgver=1.2.0
pkgrel=1
pkgdesc="A unofficial client of spotify based on electron & react"
url="https://github.com/Archean-wang/ForU"
arch=("x86_64")
license=('MIT')
source=("https://github.com/Archean-wang/ForU/releases/download/v${pkgver}/foru_${pkgver}_amd64.deb")
sha512sums=('926e506825e073533be8227622f909c8d5b45e0600adba44ed976114c05e938088492fa634e3a7624879f90b7f1003340f66775a72640c9f97959da23977a0e0')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "$pkgdir"/opt/$pkgname/resources/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
