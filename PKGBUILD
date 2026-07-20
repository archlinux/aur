# Maintainer: Naitik4516 <https://github.com/Naitik4516>
pkgname=amus
pkgver=0.6.0
pkgrel=1
pkgdesc="A fast, privacy-focused local music player built for users who own their music library"
arch=('x86_64')
url="https://github.com/Naitik4516/AMUS"
license=('MPL-2.0')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('06930a6275f05165287542ba33d2d598ba0cac6048da9fe7cde1a8183aa8a666')

package() {
    tar -xvf data.tar.gz -C "${pkgdir}"
}
