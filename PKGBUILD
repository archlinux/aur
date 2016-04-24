# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=masterpassword-gui
pkgver=2.3
pkgrel=1
pkgdesc='Java GUI for Master Password'
arch=('any')
url='http://masterpasswordapp.com/'
license=('GPL3')
depends=('java-runtime')
source=("https://ssl.masterpasswordapp.com/$pkgname.jar"
        "${pkgname}.sh")
md5sums=('a98dfaad5183f141b9af49466f3c5236'
         '6f0c67fd22697008c5f84561ecc42e1b')

package() {
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  install -m644 masterpassword-gui.jar "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
