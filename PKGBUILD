# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=wox
pkgname=${_pkgname}-bin
pkgver=2.0.0_nightly
pkgrel=35
pkgdesc="A cross-platform launcher that simply works"
arch=(x86_64)
url='https://github.com/Wox-launcher/Wox'
license=('GPL3')
depends=('webkit2gtk' 'libayatana-indicator' 'glibc' 'libx11' 'libxtst' 'pango' 'ayatana-ido' 'at-spi2-core' 'glib2' 'cairo' 'harfbuzz' 'gdk-pixbuf2' 'libayatana-appindicator' 'zlib' 'gtk3' 'libdbusmenu-glib' 'libkeybinder3')
provides=(${_pkgname})
conflicts=(${_pkgname}-git ${_pkgname})
source=(
    "${_pkgname}-${pkgver}-${pkgrel}::https://github.com/Wox-launcher/Wox/releases/download/v${pkgver//_/-}/wox-linux-amd64-20240418-44eb67"
)
sha256sums=(
    "242041174d810f4d293157e129e6548eb7d21322f7495280013a4a40b6848490"
)

package() {
    install -Dm755 "$srcdir/${_pkgname}-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${_pkgname}"
}
