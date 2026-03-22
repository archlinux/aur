# Maintainer: Your Name <your.email@example.com>
# Contributor: 
pkgname=bookstory-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A Native desktop client for Audiobookshelf"
arch=('x86_64')
url="https://github.com/kaptensea/bookstory"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libx11')
source=("${pkgname}-${pkgver}.deb::https://github.com/kaptensea/bookstory/releases/download/v${pkgver}/bookstory_${pkgver}_amd64.deb")
sha256sums=('1f1679e84d3660ffdac2e788e64c3b80b8d08b291e50311a00b42c750bd51de7')

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.*
    cp -r usr "${pkgdir}/"
}
