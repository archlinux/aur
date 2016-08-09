# Maintainer: Marius Nestor <marius softpedia com>

pkgname=musictube
pkgver=1.6
pkgrel=1
pkgdesc="A YouTube music player"
arch=('x86_64')
url="http://flavio.tordini.org/musictube"
license=('Proprietary')
depends=('qt5-base' 'qt5-declarative' 'phonon-qt5')
install='musictube.install'

	source=("http://flavio.tordini.org/files/musictube/musictube64.deb")
	sha256sums=('5f2faaae71383c07d0a0d73c01345cf68141ad2d5169036c523e2e346856b924')

package() {
  tar xvf "$srcdir/data.tar.xz" -C "$pkgdir/"
}

