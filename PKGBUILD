# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Changes pacman syntax to be more like APT"
arch=('x86_64' 'aarch64')
license=('GPLv3')
depends=('pak-config')
provides=('pak')
conflicts=('pak')
source=("https://ci.appveyor.com/api/buildjobs/3fx9sm8uw8nbx621/artifacts/pak-linux-$(uname -m)")
md5sums=('SKIP')

package() {
        chmod +x pak-linux-$(uname -m)
	mkdir -p $pkgdir/usr/bin
	mv pak-linux-$(uname -m) $pkgdir/usr/bin/pak
}
