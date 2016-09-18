pkgname=pacitude
pkgver=1.0
pkgrel=3
pkgdesc="a pacman/pacaur tui based on yaourt-gui"
arch=('i686' 'x86_64')
url="https://github.com/undeadrevo/pacitude"
license=('GPL')
depends=('sudo' 'pacaur' 'cower')
makedepends=('git')
source=('git://github.com/undeadrevo/pacitude.git')
md5sums=('SKIP')

package() {
        cd "$pkgname" &&
        install -m 755 -D pacitude "$pkgdir/usr/bin/pacitude"
}
