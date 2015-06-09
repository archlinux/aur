# Maintainer: agnotek <agnostic[dot]sn[at]gmail[dot]com>

pkgname=anoise-gui
pkgver=0.0.4
pkgrel=0
pkgdesc="GUI for Ambient Noise Player"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
options=()
conflicts=()
depends=('anoise' 'python-distutils-extra')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
md5sums=('9b21d537e47db98cdcc673696603da84')

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"
 
  install -d -m755 "${pkgdir}/usr/"

}

