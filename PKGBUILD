pkgname=libximc7
pkgver=2.9.7
pkgrel=1
pkgdesc="Library for controlling stepper and other motors.
It provides a simple C interface for controlling and configuring engine and controller.
It uses a common virtual serial port driver embedded in all OS."
arch=('i686' 'x86_64')
url="https://en.xisupport.com/projects/enxisupport/wiki/Software"
depends=('glibc>=2.14')
license=('custom')
source_i686=("http://download.ximc.ru/libximc7/libximc7-${pkgver}-i386.deb")
sha256sums_i686=('68eebf7075ce5466a4db4d522d555aa9f832ad44a0322af3c999931df31caff0')
source_x86_64=("http://download.ximc.ru/libximc7/libximc7-${pkgver}-amd64.deb")
sha256sums_x86_64=('fb69f4cedfc165e6e6f8101933d74fb5058a10c9ae7751b49ba444b0fe764bbc')

package() {
  cd "${srcdir}"

  tar -xzC "${pkgdir}" -f data.tar.gz

  cp -r ${pkgdir}/lib ${pkgdir}/usr/
  rm -r ${pkgdir}/lib
}
