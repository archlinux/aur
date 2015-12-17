# Maintainer: Marius Nestor <marius softpedia com>

pkgname=musictube
pkgver=1.5.2
pkgrel=1
pkgdesc="A YouTube music player"
arch=('i686' 'x86_64')
url="http://flavio.tordini.org/musictube"
license=('Proprietary')
depends=('qt4' 'phonon')
install='musictube.install'

if [[ "$CARCH" == "i686" ]]; then
	source=("http://flavio.tordini.org/files/musictube/musictube.deb")
	sha256sums=('1ee861f49b1ae9cd54f50c826ddabf2873c2ec72b74ed01e6d7f0b633cb9591e')
elif [[ "$CARCH" == "x86_64" ]]; then
	source=("http://flavio.tordini.org/files/musictube/musictube64.deb")
	sha256sums=('14b91736d8b84a94dae78679032091ab663f6c187695c0b87403261474d66341')
fi

package() {
  tar xvf "$srcdir/data.tar.xz" -C "$pkgdir/"
}

