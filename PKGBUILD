# Maintainer: M0Rf30

pkgname=vpointer-desktop
pkgver=1.0.1
pkgrel=1
pkgdesc="An application that simulates a laser pointer on the screen of your computer or on the canvas of the projector."
arch=('i686' 'x86_64')
url="http://www.eurograficasrl.it/stefano/vpointer.html"
license=('custom')
depends=('java-runtime-headless')
source=("http://www.eurograficasrl.it/stefano/vpointer/linux/latest/vPointerDesktop_linux.tar.gz"
	 vpointer)

package() {
  cd ${srcdir}/vPointer*
  mkdir -p ${pkgdir}/opt/vpointer-desktop
  mkdir -p ${pkgdir}/usr/bin
  cp -f vPointerDesktop.jar ${pkgdir}/opt/vpointer-desktop/
  cp -f ../vpointer ${pkgdir}/usr/bin/
  chmod +x ${pkgdir}/usr/bin/vpointer
}

md5sums=('da7c2911127fbabf63b089e09dce0d57'
         '3a4e008b25db78a05bbb5c7e9ee7e135')
