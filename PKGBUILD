# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rao-pics-bin
pkgver=0.7.9
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
sha256sums_aarch64=('50d8bc3c28c4be20ab43d327f2d09a6a7d23bb242901950d1b395acc6962b8c0')
sha256sums_x86_64=('a2ba24ef0e9d0e28e6c0c95ae8e9c92c608a4ece14d6c4ae3cb50ec05e4dc4d4')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}