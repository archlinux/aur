# Submitter: agnotek <agnostic[dot]sn[at]gmail[dot]com>
# Mantainer: ziu <frances[dot]albanese[at]gmail[dot]com>
pkgname=anoise-gui
pkgver=0.0.4
pkgrel=2
pkgdesc="GUI for Ambient Noise Player"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
options=()
conflicts=()
depends=('anoise' 'python-distutils-extra')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('8781f0e070675bf831300a7605b274ece8a0ebcefc423d37543bf650d04e8d56')

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"
 
  install -d -m755 "${pkgdir}/usr/"

}

