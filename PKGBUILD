# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Changes pacman syntax to be more like APT"
arch=('x86_64')
license=('GPLv3')
depends=('pak-config')
provides=('pak')
conflicts=('pak')
source=('https://ci.appveyor.com/api/buildjobs/aooeaj5pxbsic4mb/artifacts/pak-linux')
md5sums=('f7ab6972c028372efb16b5610d06a66c')

package() {
        chmod +x pak-linux
	mkdir -p $pkgdir/usr/bin
	mv pak-linux $pkgdir/usr/bin/pak
}
