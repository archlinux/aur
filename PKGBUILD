# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="Changes pacman syntax to be more like APT"
arch=('x86_64' 'aarch64')
license=('GPLv3')
depends=('pak-config')
provides=('pak')
conflicts=('pak')
source=("https://minio.arsenm.dev/pak/$pkgver/pak-linux-$(uname -m)")
md5sums=('SKIP')

package() {
        chmod +x pak-linux-$(uname -m)
	mkdir -p $pkgdir/usr/bin
	mv pak-linux-$(uname -m) $pkgdir/usr/bin/pak
}
