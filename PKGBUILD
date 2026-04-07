# Maintainer: Your Name <your.email@example.com>
# Contributor: 
pkgname=bookstory-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A Native desktop client for Audiobookshelf"
arch=('x86_64')
url="https://github.com/kaptensea/bookstory"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libx11')
source=("${pkgname}-${pkgver}.deb::https://github.com/kaptensea/bookstory/releases/download/v${pkgver}/bookstory_${pkgver}_amd64.deb")
sha256sums=('208f650d08835ae22c18dc8fa18deee320f97399ad01669849466baeeebc507a')

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.*
    cp -r usr "${pkgdir}/"
}
