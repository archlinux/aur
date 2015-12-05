# Maintainer: Your Name <youremail@domain.com>
pkgname=potato
pkgver=1
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
md5sums=('1063efc13fac99d64bac8ac97e6cf919'
         '1ddcbd2862764b43d75fb1e484bf8912')

package() {
	install -D $srcdir/potato.sh $pkgdir/usr/bin/$pkgname
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
