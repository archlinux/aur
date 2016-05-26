#Maintainer: Yan Burdonsky <psyrccio@gmail.com>
#Contributor: Yan Burdonsky <psyrccio@gmail.com>
pkgname=anoise-media
pkgver=0.0.17
pkgrel=1
pkgdesc="Ambient Noise Library. Sounds and icons for Anoise Player"
arch=('any')
license=('GPL3')
url="https://launchpad.net/~costales/+archive/ubuntu/anoise"
options=()
conflicts=()
depends=('python-distutils-extra')
optdepends=()
source=("https://launchpad.net/~costales/+archive/ubuntu/anoise/+files/${pkgname}_${pkgver}_all.deb")
sha256sums=('50580824b15384f1d639312c54e779735ca7600ab2ebd6f651d7656baa78b207')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"

  install -d -m755 "${pkgdir}/usr/"

}
