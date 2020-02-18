
# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-config-pacman-git
pkgver=r3.f0ec020
pkgrel=1
pkgdesc="A pacman config for pak"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('aptman-git')
provides=('pak-config')
source=("https://gitlab.com/moussaelianarsen/pak/raw/master/plugins/pacman/pak.cfg")
md5sums=('SKIP')
conflicts=('pak-config-yay-git')

package() {
	install -Dm644 pak.cfg $pkgdir/etc/pak.cfg
}
