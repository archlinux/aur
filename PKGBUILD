# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-config-yay-git
pkgver=r3.f0ec020
pkgrel=1
pkgdesc="A yay config for pak"
arch=('x86_64')
url="https://gitlab.com/moussaelianarsen/pak"
license=('GPL3')
depends=('yay' 'aptyay-git')
provides=('pak-config')
source=("https://gitlab.com/moussaelianarsen/pak/raw/master/plugins/yay/pak.cfg")
md5sums=('SKIP')
conflicts=('pak-config-pacman-git')

package() {
	install -Dm644 pak.cfg $pkgdir/etc
}
