# Maintainer: Marius Nestor <marius softpedia com>

pkgname=musictube
pkgver=1.5
pkgrel=1
pkgdesc="A YouTube music player"
arch=('i686' 'x86_64')
url="http://flavio.tordini.org/musictube"
license=('Proprietary')
depends=('qt4' 'phonon')
install='musictube.install'

if [[ "$CARCH" == "i686" ]]; then
	source=("http://flavio.tordini.org/files/musictube/musictube.deb")
	sha256sums=('65fe0bba1fa4352a969abc22b95d83d865aa08d764bab2d75cb948e88e9f9674')
elif [[ "$CARCH" == "x86_64" ]]; then
	source=("http://flavio.tordini.org/files/musictube/musictube64.deb")
	sha256sums=('e0bd22d7694c51ecfe620f93de089ee286de62ec178132fe74912681ffb721bb')
fi

package() {
  tar xzvf "$srcdir/data.tar.gz" -C "$pkgdir/"
}

