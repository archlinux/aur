# Maintainer: Naitik4516 <https://github.com/Naitik4516>
pkgname=amus
pkgver=0.6.1
pkgrel=1
pkgdesc="A fast, privacy-focused local music player built for users who own their music library"
arch=('x86_64')
url="https://github.com/Naitik4516/AMUS"
license=('MPL-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'alsa-lib' 'hicolor-icon-theme')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('4f7ff71e53c38cb2223a792e195acee1008c30a878a26c9823c9644fdc896e0d')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
