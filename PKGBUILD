pkgname=pacitude
pkgver=2.0
pkgrel=1
pkgdesc="a pacman/pacaur tui based on archfi"
arch=('i686' 'x86_64')
url="https://github.com/undeadrevo/pacitude"
license=('GPL')
depends=('sudo' 'pacaur' 'cower')
optdepends=('nano' 'vi' 'vim' 'edit')
makedepends=('git')
source=('git://github.com/undeadrevo/pacitude.git')
md5sums=('SKIP')

package() {
        cd "$pkgname" &&
        install -m 755 -D pacitude "$pkgdir/usr/bin/pacitude"
}
