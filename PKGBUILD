# Maintainer: Your Name <your.email@example.com>
# Contributor: 
pkgname=bookstory
pkgver=1.2.0
pkgrel=1
pkgdesc="Bookstory – Audiobook and Podcast Manager"
arch=('x86_64')
url="https://github.com/kaptensea/bookstory"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libx11')
source=("${pkgname}-${pkgver}.deb::https://github.com/kaptensea/bookstory/releases/download/v${pkgver}/bookstory_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}"
    cp -r "${srcdir}/usr" "${pkgdir}/"
}
