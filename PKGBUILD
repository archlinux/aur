pkgname=maya
pkgver=2016_SP5
pkgrel=1
pkgdesc="Maya software helps you tackle challenging character creation and digital animation productions. Get powerful, integrated 3D tools on a robust, extensible CG pipeline core."
arch=('x86_64')
url="http://www.autodesk.com/products/maya/overview"
license=('custom: unlimited')
depends=('libpng12' 'tcsh' 'libxp' 'openssl' 'libjpeg' 'libtiff')
makedepends=('rpmextract')
conflicts=()
install=maya.install
source=(http://download.autodesk.com/us/support/files/maya_2016_service_pack_5/Autodesk_Maya_2016_SP5_EN_Linux_64bit.tgz)
md5sums=('5b88676c1c3239ea26b9de656340e974')

package() {

  cd "$pkgdir"

  msg2 "Unpacking Red Hat .rpm files. This could take a while..."

  for i in "$srcdir"/*.rpm; do
      msg2 $i
      rpmextract.sh $i
  done

}

