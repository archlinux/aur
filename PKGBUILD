# Maintainer: Your Name <your.email@example.com>
# Contributor: 
pkgname=bookstory-bin
pkgver=1.4.1
pkgrel=2
pkgdesc="A Native desktop client for Audiobookshelf"
arch=('x86_64')
url="https://github.com/kaptensea/bookstory"
license=('MIT')
depends=('libappindicator-gtk3' 'webkit2gtk-4.1' 'gtk3' 'libx11')
source=("${pkgname}-${pkgver}.deb::https://github.com/kaptensea/bookstory/releases/download/v${pkgver}/bookstory_${pkgver}_amd64.deb")
sha256sums=('74d6ff6de18172a3a7c2b88713752b3f4e560b75f6d792110df4481728595363')

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.*
    cp -r usr "${pkgdir}/"
}
