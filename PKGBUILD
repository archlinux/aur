# Maintainer: Corey Mwamba <contact me. where? coreymwamba donut co donut uk>

pkgname=ddptools
pkgver=1.1
pkgrel=2
pkgdesc="Create, inspect, verify and convert DDP 2.00 masters for Red Book CD audio recplicaton"
arch=('x86_64')
url="http://ddp.andreasruge.de/"
license=('unknown')
groups=('pro-audio')
source=("http://ddp.andreasruge.de/dist/$pkgname-$pkgver-$CARCH-elf.tar.gz")

package() {
	cd "$pkgname-$pkgver"
	prefix=$pkgdir/usr ./install.sh --no-uninstaller
}
md5sums=('49d9a2af6562fa597123620f1c7bb166')
