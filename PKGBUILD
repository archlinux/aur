# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=wox
pkgname=${_pkgname}-bin
pkgver=2.0.0_nightly
pkgrel=31
pkgdesc="A cross-platform launcher that simply works"
arch=(x86_64)
url='https://github.com/Wox-launcher/Wox'
license=('GPL3')
depends=('webkit2gtk' 'libayatana-indicator' 'glibc' 'libx11' 'libxtst' 'pango' 'ayatana-ido' 'at-spi2-core' 'glib2' 'cairo' 'harfbuzz' 'gdk-pixbuf2' 'libayatana-appindicator' 'zlib' 'gtk3' 'libdbusmenu-glib' 'libkeybinder3')
provides=(${_pkgname})
conflicts=(${_pkgname}-git ${_pkgname})
source=(
    "${_pkgname}-${pkgver}-${pkgrel}::https://github.com/Wox-launcher/Wox/releases/download/v${pkgver//_/-}/wox-linux-amd64-20240416-03bd1c"
)
sha256sums=(
    "14c85cfbce863de66c5212cb6d791b38a7bb91e19b5395ae6453fe9564f0d63b"
)

package() {
    install -Dm755 "$srcdir/${_pkgname}-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${_pkgname}"
}
