# Maintainer: robertfoster

pkgname=vpointer-desktop
pkgver=1.0.2
pkgrel=1
pkgdesc="An application that simulates a laser pointer on the screen of your computer or on the canvas of the projector."
arch=('i686' 'x86_64')
url="http://www.eurograficasrl.it/stefano/vpointer.html"
license=('custom')
depends=('java-runtime-headless')
source=("http://www.eurograficasrl.it/stefano/vpointer/linux/latest/vPointerDesktop_linux.tar.gz"
	 vpointer)

package() {
  cd "${srcdir}/vPointerDesktop_${pkgver}_linux"
  mkdir -p ${pkgdir}/opt/vpointer-desktop
  mkdir -p ${pkgdir}/usr/bin
  cp -f vPointerDesktop.jar ${pkgdir}/opt/vpointer-desktop/
  cp -f ../vpointer ${pkgdir}/usr/bin/
  chmod +x ${pkgdir}/usr/bin/vpointer
}

md5sums=('2c3c46b3bf3988ed7697986999934d0c'
         '3a4e008b25db78a05bbb5c7e9ee7e135')
