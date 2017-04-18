pkgname=xilab
pkgver=1.13.13
pkgrel=1
pkgdesc="It provides a simple GUI to control stepper and DC motors."
arch=('i686' 'x86_64')
url="https://en.xisupport.com/projects/enxisupport/wiki/Software"
license=('custom')
depends=('libximc7=2.9.7' 'libqwt6=6.0.0' 'qt4>=4.8.7')
source_i686=("http://download.ximc.ru/xilab/xilab-${pkgver}-i386.deb")
sha256sums_i686=('1dd81289fe3b855333691e4934725cf5c0952de397037b04bf1f6f17415c373d')
source_x86_64=("http://download.ximc.ru/xilab/xilab-${pkgver}-amd64.deb")
sha256sums_x86_64=('210fefdb80c41356063ac06519209af80a0deddd56922043e611a414926b66be')

package() {
  cd "${srcdir}"

  tar -xzC "${pkgdir}" -f data.tar.gz
}
