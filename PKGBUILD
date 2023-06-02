# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kinda-bard-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Google Bard Desktop Application"
arch=(x86_64)
url="https://www.zorbawong.com/"
_githuburl="https://github.com/zorbajwhk/KindaBard"
license=('AGPL3')
depends=('libxdamage' 'nss' 'glib2' 'alsa-lib' 'at-spi2-core' 'libx11' 'libcups' 'libxfixes' 'expat' 'libxcomposite' 'libxrandr' 'pango' \
    'cairo' 'libxcb' 'mesa' 'libxkbcommon' 'gtk3' 'nspr' 'libdrm' 'hicolor-icon-theme' 'dbus' 'gcc-libs' 'glibc' 'libxext')
conflicts=("${pkgname%-bin}")
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('01a88b842648036f9034e50ba5c626a33281ae23e4b279bf6aea67dc43aec75c')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}