pkgname=xilab
pkgver=1.13.10
pkgrel=1
pkgdesc="It provides a simple GUI to control stepper and DC motors."
arch=('i686' 'x86_64')
url="https://en.xisupport.com/projects/enxisupport/wiki/Software"
license=('custom')
depends=('libximc7=2.9.7' 'libqwt6=6.0.0' 'qt4>=4.8.7')
source_i686=("http://download.ximc.ru/xilab/xilab-${pkgver}-i386.deb")
sha256sums_i686=('f89a4515fdbaf38b1a6e91a94b9af657eddff1b8cfe3d8920dc04120908659be')
source_x86_64=("http://download.ximc.ru/xilab/xilab-${pkgver}-amd64.deb")
sha256sums_x86_64=('5e4bbd03fdce9edde6128d4fdcbbf41aed4a92fe8751f601149441bf08aa8e35')

package() {
  cd "${srcdir}"

  tar -xzC "${pkgdir}" -f data.tar.gz
}
