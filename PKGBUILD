# Maintainer: Naitik4516 <https://github.com/Naitik4516>
pkgname=amus
pkgver=0.9.0
pkgrel=1
pkgdesc="A fast, privacy-focused local music player built for users who own their music library"
arch=('x86_64')
url="https://github.com/Naitik4516/AMUS"
license=('MPL-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'alsa-lib' 'hicolor-icon-theme' 'gtk-layer-shell')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('90712a934d57b0c39f2d77d7fdd6d1f1b0b66d5ffaffa09b2eedf5ee8add2d9a')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
