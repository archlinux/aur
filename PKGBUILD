#Maintainer: Yan Burdonsky <psyrccio@gmail.com>
#Contributor: Yan Burdonsky <psyrccio@gmail.com>
pkgname=anoise
pkgver=0.0.25
pkgrel=3
pkgdesc="Ambient Noise Player. Relax or concentrate with a noise"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
options=()
conflicts=()
depends=('anoise-media' 'python-distutils-extra' 'gstreamer0.10' 'gstreamer0.10-python')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('7d6215cfcbce1c5a9a48c61d62a2851f142dac21b818f8820aed37ab84a6f2a0')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"

  install -d -m755 "${pkgdir}/usr/"

}
