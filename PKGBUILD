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

sha256sums=('1c8a1cd1969536e7516e4bd819bc7f27fa478a1a65c34c5eab6b6fbf21eea46f'
            'f0e7155f754cc14e876c5b6fb6a066852f3c56b6bac9f38bc9863706edf79369')
