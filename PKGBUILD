# Contributor: twa022 <twa022 at gmail dot com>

pkgname=violetumleditor
pkgver=2.1.0
pkgrel=2
pkgdesc="Java UML diagram editor"
arch=('any')
url="http://sourceforge.net/projects/violet"
license=('GPL')
depends=('java-runtime')
source=( ${pkgname}-${pkgver}.deb::http://sourceforge.net/projects/violet/files/violetumleditor/2.1.0/violetumleditor-2.1.0.deb/download )
sha256sums=('1a2bb8f3907cbd517ac9b25db65621f5e3316ab1d5797715241e509f39981aa1')

package() {
  cd ${srcdir}
  bsdtar -x -f data.tar.gz -C ${pkgdir}
  mkdir -p ${pkgdir}/usr/bin/
  chmod a+x ${pkgdir}/usr/share/${pkgname}/${pkgname}.sh
  ln -s /usr/share/${pkgname}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
