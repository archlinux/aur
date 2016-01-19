# Contributor: Guillaume ALAUX <Guillaume at ALAUX dot net>
# Maintainer: Jose Riha < jose 1711 gmail com >

pkgname=scrabble3d
pkgver=3.1.4_1
pkgrel=1
pkgdesc="Highly customizable Scrabble game (classic, SuperScrabble, 3D games)"
depends=(gtk2)
arch=('i686' 'x86_64')
url="http://scrabble.sourceforge.net/wiki/"
license=('GPL')

source_i686=(http://downloads.sourceforge.net/project/scrabble/Main_Program/Linux/Scrabble3D-i386.deb)
source_x86_64=(http://downloads.sourceforge.net/project/scrabble/Main_Program/Linux/Scrabble3D-x86_64.deb)

md5sums_i686=('3d5e1ae45fbdac02f9ba7ca6740cb5b8')
md5sums_x86_64=('406e6cb558c4f440f3db4aeae48b2149')

package() {
  cd "${srcdir}"

  ar x Scrabble3D-*.deb
  tar xJf data.tar.xz -C ${pkgdir}
  chmod -R 755 ${pkgdir}/usr
}
