#Maintainer: Yan Burdonsky <psyrccio@gmail.com>
#Contributor: Yan Burdonsky <psyrccio@gmail.com>
pkgname=anoise-community-extension2
pkgver=0.0.4
pkgrel=1
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
sha256sums=('ae7b05f943856bcc890a843a4c044c5b90d8b2e79a3103f8e0f1a42aa78d9205')

build() {
  cd "${srcdir}"
}

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}_all.deb" > /dev/null
  tar -xJf data.tar.xz -C "${pkgdir}"

  install -d -m755 "${pkgdir}/usr/"

}
