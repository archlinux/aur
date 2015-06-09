# Maintainer: agnotek <agnostic[dot]sn[at]gmail[dot]com>

pkgname=anoise
pkgver=0.0.25
pkgrel=0
pkgdesc="Ambient Noise Player. Relax or concentrate with a noise"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
options=()
conflicts=()
depends=('anoise-media' 'python-distutils-extra' 'gstreamer0.10' 'gstreamer0.10-python')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
md5sums=('1f03caa5b7a9ba59cae1814c7aacad5e')

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"
 
  install -d -m755 "${pkgdir}/usr/"

}

