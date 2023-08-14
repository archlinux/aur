# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=music-you-bin
pkgver=2.0.13
pkgrel=1
pkgdesc="一个美观简约的Material Design 3 (Material You) 风格网易云音乐播放器pc客户端"
arch=('x86_64')
url="https://v-player-git-dev-gumengyu.vercel.app/"
_githuburl="https://github.com/GuMengYu/music-you"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('mesa' 'gcc-libs' 'libxext' 'libdrm' 'glib2' 'gtk3' 'libx11' 'nspr' 'alsa-lib' 'libcups' 'nss' 'libxcb' 'dbus' \
    'libxcomposite' 'expat' 'libxdamage' 'pango' 'libxfixes' 'cairo' 'at-spi2-core' 'libxkbcommon' 'libxrandr' 'glibc' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('4fc3810ec715b30f1c4944cd5c31fc1c469af6b50aabaf1fb02393167760ae24')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}