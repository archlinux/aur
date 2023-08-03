# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rao-pics-bin
pkgver=0.7.7
pkgrel=1
pkgdesc="RaoPics help you visit material on any devices, base on Eagle/Billfish/Pixcall and other photos material management apps."
arch=('aarch64' 'x86_64')
url="https://rao.pics/"
_githuburl="https://github.com/rao-pics/rao-pics"
license=('AGPL3')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'expat' 'alsa-lib' 'libcups' 'libxfixes' 'dbus' 'cairo' 'mesa' 'openssl-1.1' 'glib2' 'libxrandr' 'libx11' 'libxext' \
    'libxcomposite' 'libdrm' 'at-spi2-core' 'libxcb' 'pango' 'glibc' 'libxkbcommon' 'nss' 'libxdamage' 'bash' 'wayland' 'nspr' 'gtk3' 'gcc-libs')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/Rao.Pics-${pkgver}-linux-arm64-openssl-1.1.x.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/Rao.Pics-${pkgver}-linux-amd64-openssl-1.1.x.deb")
sha256sums_aarch64=('733b4015c8831ae18052c0899d9b90ab4ca14dfbdf942cd13fee171aa2313cd8')
sha256sums_x86_64=('b3bf0f7e36be6b429c7804b8fa3390d8a75d0963d1d50cfcd12b11ef24ccfe03')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}