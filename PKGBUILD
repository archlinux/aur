# Maintainer: Your Name <youremail@domain.com>
pkgname=potato
pkgver=2
pkgrel=1
pkgdesc="A pomodoro timer for the shell"
arch=('any')
url="https://github.com/Bladtman242/potato"
license=('MIT')
groups=()
depends=('alsa-utils')
provides=('potato')
install=
changelog=
source=(potato.sh LICENSE)
noextract=()
md5sums=('8d6f4462e71e0a77f0f4dbbabf74f65d'
         '1ddcbd2862764b43d75fb1e484bf8912')

package() {
	install -D $srcdir/potato.sh $pkgdir/usr/bin/$pkgname
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
