#Submitter: agnotek <agnostic[dot]sn[at]gmail[dot]com>
#Mantainer: ziu <frances[dot]albanese[at]gmail[dot]com>
pkgname=anoise-community-extension3
pkgver=0.0.1
pkgrel=2
pkgdesc="Ambient Noise Community Library. Sounds and icons from the users"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
install=
options=()
conflicts=()
depends=('anoise' 'python-distutils-extra' 'gstreamer0.10' 'gstreamer0.10-python')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('ee42798781cae753667b0c25485c72567ea849e3ddaa1f6369f27644799dae2a')

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"
 
  install -d -m755 "${pkgdir}/usr/"

}

