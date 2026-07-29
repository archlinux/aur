# Maintainer: Naitik4516 <https://github.com/Naitik4516>
pkgname=amus
pkgver=0.7.0
pkgrel=1
pkgdesc="A fast, privacy-focused local music player built for users who own their music library"
arch=('x86_64')
url="https://github.com/Naitik4516/AMUS"
license=('MPL-2.0')
depends=('gtk3' 'webkit2gtk-4.1' 'alsa-lib' 'hicolor-icon-theme')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('7a4a212d900d477f62332ed49c4edd328a3abbfac9271b6d91171d156eb0837f')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
