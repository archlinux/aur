# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kitti3
pkgver=0.2.4
pkgrel=1
pkgdesc="Kitty drop-down service for i3wm"
arch=('any')
url="https://github.com/LandingEllipse/kitti3"
license=('BSD3')
depends=('i3-wm' 'kitty' 'python>=3.6' 'python-i3ipc')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('f7c6b3032987d3a35a9776091fd9afa9')

package() {
	mkdir -p ${pkgdir}/usr/bin
	cp "$pkgname-$pkgver"/src/kitti3/main.py ${pkgdir}/usr/bin/kitti3
	chmod 755 ${pkgdir}/usr/bin/kitti3
}