# Contributor: Braeden Mollot <3mollot at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=min-browser-bin
pkgver=1.27.0
pkgrel=1
pkgdesc="A fast, minimal browser that protects your privacy"
arch=('x86_64')
url="https://minbrowser.org/"
_githuburl="https://github.com/minbrowser/min"
license=('Apache')
depends=('gtk3' 'libxdamage' 'glibc' 'libxkbcommon' 'hicolor-icon-theme' 'libsecret' 'libdrm' 'libxcomposite' 'alsa-lib' 'expat' 'nodejs' \
    'libxcb' 'nspr' 'libxext' 'glib2' 'libx11' 'libxfixes' 'mesa' 'nss' 'sh' 'libxrandr' 'cairo' 'libcups' 'dbus' 'at-spi2-core' 'gcc-libs' 'pango')
install=
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-amd64.deb")
noextract=()
sha256sums=('4c003de3b63b881bbe0b57db51101dc8473f76bfecf124a5f770158e8ee5acd0')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}