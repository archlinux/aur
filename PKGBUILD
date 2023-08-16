# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=no-fwl-bin
_appname=NoFWL
pkgver=0.1.0
pkgrel=2
pkgdesc="NoFWL Desktop Application"
arch=("x86_64")
url="https://nofwl.com/"
_githuburl="https://github.com/lencx/nofwl"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'hicolor-icon-theme' 'dbus' 'glib2' 'gcc-libs' 'gtk3' 'cairo' 'openssl' 'webkit2gtk' 'gdk-pixbuf2')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}_${pkgver}_linux_${CARCH}.deb")
sha256sums=('01ec16f7997ceb8c9a017d3841cf63c3b29f59fb608523c3d54bd96ad72aa481')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}" --gname root --uname root
}