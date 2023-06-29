# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sengi-bin"
pkgver=1.6.3
pkgrel=1
pkgdesc="Mastodon & Pleroma Multi-account Desktop Client"
arch=('x86_64')
url="https://github.com/NicolasConstant/sengi"
_downurl="https://github.com/NicolasConstant/sengi-electron"
license=('AGPL3')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('nss' 'at-spi2-core' 'alsa-lib' 'gtk3' 'nspr' 'mesa' 'libxkbcommon' 'pango' 'gcc-libs' 'libxext' 'libdrm' 'dbus' 'cairo' \
    'hicolor-icon-theme' 'libxrandr' 'libxcomposite' 'libxfixes' 'libxcb' 'libcups' 'expat' 'glib2' 'libxdamage' 'libx11' 'glibc')
source=("${pkgname%-bin}${pkgver}.deb::${_downurl}/releases/download/v${pkgver}/Sengi-${pkgver}-linux.deb")
sha256sums=('d1f0244ec5e9d46a1c859c0f0372f4fd505de9a7454b98d48854064b757f513c')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}