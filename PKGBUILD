# Submitter: agnotek <agnostic[dot]sn[at]gmail[dot]com>
# Mantainer: ziu <frances[dot]albanese[at]gmail[dot]com>

pkgname=anoise-media
pkgver=0.0.16
pkgrel=2
pkgdesc="Ambient Noise Library. Sounds and icons for Anoise Player"
arch=('any')
license=('GPL3')
url="https://launchpad.net/~costales/+archive/ubuntu/anoise"
options=()
conflicts=()
depends=('python-distutils-extra')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('8a458f503a85fa4ac02cefe125713db6d913c5a63e00e4516b3f5cfd5b4a962b')

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"
 
  install -d -m755 "${pkgdir}/usr/"

}

