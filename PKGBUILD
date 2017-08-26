# Maintainer/Contributor: Sachiko <undeadrevo@gmail.com>

pkgname=pacitude
pkgver=2.1
pkgrel=3
pkgdesc="a pacman/pacaur tui based on archfi"
arch=('i686' 'x86_64')
url="https://github.com/undeadrevo/pacitude"
license=('GPL')
depends=('sudo' 'pacaur' 'cower' 'reflector')
optdepends=('nano' 'vi' 'vim' 'kilo-git' 'pico' 'slap')
makedepends=('git')
source=('git://github.com/undeadrevo/pacitude.git')
md5sums=('SKIP')

package() {
        cd "$pkgname" &&
        install -m 755 -D pacitude "$pkgdir/usr/bin/pacitude"
}
