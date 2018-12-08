#Maintainer: Alexander Adler <alexadler1@protonmail.com>
#Contributor: Yan Burdonsky <psyrccio@gmail.com>
pkgname=anoise
pkgver=0.0.29
pkgrel=1
pkgdesc="Ambient Noise Player. Relax or concentrate with a noise"
arch=('any')
license=('GPL3')
url="https://code.launchpad.net/anoise"
options=()
conflicts=()
makedeps=('bison' 'flex')
depends=('anoise-media' 'python-distutils-extra' 'gstreamer0.10' 'gstreamer0.10-python')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('SKIP')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"

  install -d -m755 "${pkgdir}/usr/"

}
