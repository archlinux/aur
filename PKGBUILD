# Maintainer: agnotek <agnostic[dot]sn[at]gmail[dot]com>

pkgname=anoise-media
pkgver=0.0.16
pkgrel=0
pkgdesc="Ambient Noise Library. Sounds and icons for Anoise Player"
arch=('any')
license=('GPL3')
url="https://launchpad.net/~costales/+archive/ubuntu/anoise?field.series_filter=vivid"
options=()
conflicts=()
depends=('python-distutils-extra')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
md5sums=('e373afd6b76074659648653b27f25ae6')

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"
 
  install -d -m755 "${pkgdir}/usr/"

}

