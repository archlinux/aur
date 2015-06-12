# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=qscrabble3d
pkgver=3.1.0_29
pkgrel=1
pkgdesc="Highly customizable Scrabble game (classic, SuperScrabble, 3D games) - Qt version"
arch=('x86_64')
url="http://scrabble.game-server.cc/wiki"
license=('GPL')
md5sums=('214952f52e8fc4ca38fcc8d9167a1721')

source=(http://downloads.sourceforge.net/project/scrabble/Main_Program/Linux/QScrabble3D-${arch}.deb)

package() {
  cd "${srcdir}"

  ar x QScrabble3D-*.deb
  tar xf data.tar.gz -C ${pkgdir}
  chmod -R 755 ${pkgdir}/usr
}
