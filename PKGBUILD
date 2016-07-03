# Maintainer: Sam Burgos < jsbm1089 at gmail dot com >

pkgname=mint-y-icons
pkgver='1.0.3'
pkgrel='2'
pkgdesc='New icons from LinuxMint 18 inspired by the Moka icon set. Stable releases'
arch=('any')
url='http://packages.linuxmint.com'
license=('GPL3')
depends=('mint-x-icons' 'gtk-update-icon-cache')
conflicts=('mint-y-icons-git')
source=("${url}/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('3c01ee0b2c646f4b2e909b8ea9280cbf5f3a9711ec629bffd9530fbe912fcb94')

prepare() {
	find "${srcdir}" -type d ! -perm 755 -exec chmod 755 {} +
	find "${srcdir}" -type f ! -perm 644 -exec chmod 644 {} +
}

package() {
  cd ${srcdir}/${pkgname}
  cp -aR ./usr ${pkgdir}
}


