# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ubports-installer-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A simple tool to install Ubuntu Touch on UBports devices"
arch=('x86_64')
url="https://github.com/ubports/ubports-installer"
license=('GPL3')
conflits=("${pkgname%-bin}")
depends=('libxcb' 'libxkbcommon' 'libusb' 'glibc' 'cairo' 'gtk3' 'nss' 'hicolor-icon-theme' 'libxcomposite' 'lib32-gcc-libs' \
    'dbus' 'expat' 'nspr' 'libx11' 'gcc-libs' 'libxext' 'libxfixes' 'pango' 'libxdamage' 'libdrm' 'alsa-lib' 'libcups' \
    'lib32-glibc' 'glib2' 'libxrandr' 'mesa' 'at-spi2-core' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.deb")
sha256sums=('a530f8fbb867b07aafdabf06459b2ffec5f64202a56f13bf87ca0c225b5b1189')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}