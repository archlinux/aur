# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=pacman-screen-nosuid-hook
pkgver=0.1
pkgrel=1
pkgdesc='Pacman hook to drop suid bit on screen'
arch=('any')
license=('MIT')
depends=('findutils' 'coreutils' 'sed')
source=('00-screen-nosuid.hook')
sha512sums=('126fac4a04f8821eb9943dc0651cb42f67456b910c75d180a86bc40917279e75811b932e0714d9a20d1f7648c50d79a5c5f97edfbfec1d83ba62938a46142153')
install=${pkgname}.install

package() {
	install -Dm644 '00-screen-nosuid.hook' "${pkgdir}/usr/share/libalpm/hooks/00-screen-nosuid.hook"
}
