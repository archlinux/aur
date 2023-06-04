# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=eagle-animation-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="An awesome, free and open-source animation software."
arch=('x86_64')
url="https://brickfilms.com/"
_githuburl="https://github.com/brick-a-brack/eagle-animation"
license=('GPL3')
depends=('nodejs' 'libxrandr' 'libxfixes' 'hicolor-icon-theme' 'libx11' 'glib2' 'libxcomposite' 'nspr' 'glibc' 'libxkbcommon' 'expat' \
    'libxcb' 'nss' 'cairo' 'alsa-lib' 'libxdamage' 'dbus' 'mesa' 'libxext' 'libcups' 'pango' 'libdrm' 'gcc-libs' 'at-spi2-core' 'gtk3')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.deb")
sha256sums=('6bbc4d124686d12ecc566b70581896080f75bde4bc69da45cd7a12f1b44e38de')
 
package() {
   bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}