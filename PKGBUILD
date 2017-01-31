pkgname=arch-checkrestart
pkgver=1.0.0
pkgrel=1
pkgdesc="Arch Linux port of Debian's checkrestart utility"
url=https://gitla.in/flisk/arch-checkrestart
arch=('any')
license=('GPL2')
depends=('lsof' 'python')

package() {
  cd ..
  install -D ./checkrestart "${pkgdir}/usr/bin/checkrestart"
  install -D ./checkrestart.1 "${pkgdir}/usr/share/man/man1/checkrestart.1"
  gzip "${pkgdir}/usr/share/man/man1/checkrestart.1"
}
