# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwiirc-desktop-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Next generation of the Kiwi IRC web client"
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url="https://kiwiirc.com/"
_githuburl="https://github.com/kiwiirc/kiwiirc"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage" "kiwiirc")
depends=('libxcomposite' 'cairo' 'mesa' 'glib2' 'nspr' 'libxkbcommon' 'libxext' 'gcc-libs' 'libxdamage' 'at-spi2-core' 'libdrm' 'expat' \
    'glibc' 'gtk3' 'libxcb' 'alsa-lib' 'dbus' 'gdk-pixbuf2' 'nss' 'hicolor-icon-theme' 'libxfixes' 'pango' 'libx11' 'libcups' 'libxrandr')
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_armv7l.deb")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_arm64.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_v${pkgver}-1_linux_amd64.deb")
sha256sums_armv7h=('b0dfe2645072892650551e72b8327de772700a6f62db7711275247264a21fcbd')
sha256sums_aarch64=('262da25b39d9d273e17c02b55418f9a28b722e142f44d4edd703e8cb8d22ee4a')
sha256sums_i686=('1d8d5f739b4664317923a3a996926d4d858ce330524f64ce95a8fd836304a134')
sha256sums_x86_64=('7b59f5d524e247447d002ede6b4fa2bdb3c31db6a0a7648ef58030c3e2edfdf6')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}