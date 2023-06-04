# Contributor: Braeden Mollot <3mollot at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=min-browser-bin
pkgver=1.28.0beta
_pkgver=1.28.0-beta
pkgrel=1
pkgdesc="A fast, minimal browser that protects your privacy"
arch=('x86_64')
url="https://minbrowser.org/"
_githuburl="https://github.com/minbrowser/min"
license=('Apache')
depends=('gtk3' 'libxdamage' 'glibc' 'libxkbcommon' 'hicolor-icon-theme' 'libsecret' 'libdrm' 'libxcomposite' 'alsa-lib' 'expat' 'nodejs' \
    'libxcb' 'nspr' 'libxext' 'glib2' 'libx11' 'libxfixes' 'mesa' 'nss' 'sh' 'libxrandr' 'cairo' 'libcups' 'dbus' 'at-spi2-core' 'gcc-libs' 'pango')
install=
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${_pkgver}/${pkgname%-browser-bin}-${_pkgver}-amd64.deb")
noextract=()
sha256sums=('c6f8b354b8fe613c5a9d748e4a944f9552038091a7c9a10cdc9078c625efbc51')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}