# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=wox
pkgname=${_pkgname}-bin
pkgver=2.0.0_alpha.1
pkgrel=82
pkgdesc="A cross-platform launcher that simply works"
arch=(x86_64)
url='https://github.com/Wox-launcher/Wox'
license=('GPL3')
depends=('webkit2gtk' 'libayatana-indicator' 'glibc' 'libx11' 'libxtst' 'pango' 'ayatana-ido' 'at-spi2-core' 'glib2' 'cairo' 'harfbuzz' 'gdk-pixbuf2' 'libayatana-appindicator' 'zlib' 'gtk3' 'libdbusmenu-glib')
provides=(${_pkgname})
conflicts=(${_pkgname}-git ${_pkgname})
options=(!strip)
source=(
    "${_pkgname}-${pkgver}-${pkgrel}::https://github.com/Wox-launcher/Wox/releases/download/v${pkgver//_/-}/wox-linux-amd64-20231228-f67d18"
)
sha256sums=(
    "1082a45ee668970d1a3f1e4358f6a4a678cc4010f22107bd22875094bd195769"
)

package() {
    install -Dm755 "$srcdir/${_pkgname}-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${_pkgname}"
}
