# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rao-pics-bin
pkgver=0.7.8
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
sha256sums_aarch64=('c156689455cddeb0524d056450a9eff7dc046e5bb2127ef5981c45841b9b089d')
sha256sums_x86_64=('3c70b4abc601076af1d90c924fe32e8052f71c7c4e840ff1179cdf696cb083d8')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}