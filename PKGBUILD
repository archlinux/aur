# Maintainer: Archean <1091876908@qq.com>
pkgname=foru
pkgver=1.2.0
pkgrel=2
pkgdesc="A unofficial client of spotify based on electron & react"
url="https://github.com/Archean-wang/ForU"
arch=("x86_64")
license=('MIT')
source=("https://github.com/Archean-wang/ForU/releases/download/v${pkgver}/foru_${pkgver}_amd64.deb")
sha512sums=('a95d66c7309baeb7d7b9ddfc1f35f8e7afac81050b3b192a2bf7cacdcfb94dd2339f70d7f98dcf871c3877d3f9f55f0c447777f83cea88dbc4d023db98aa8a33')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    install -Dm644 "$pkgdir"/opt/$pkgname/resources/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
