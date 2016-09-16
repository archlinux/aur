pkgname=pacitude
pkgver=9.a5172d7
pkgrel=1
pkgdesc="a pacman/pacaur wrapper with apt inspired syntax"
arch=('i686' 'x86_64')
url="https://github.com/undeadrevo/pacitude"
license=('WTFPL')
depends=('sudo' 'pacaur' 'cower')
makedepends=('git')
source=('git://github.com/undeadrevo/pacitude.git')
md5sums=('SKIP')

package() {
        cd "$pkgname" &&
        install -m 755 -D pacitude "$pkgdir/usr/bin/pacitude"
}
