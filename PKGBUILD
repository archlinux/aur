# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptree'
pkgver=1.1.2
pkgrel=1
pkgdesc='A tree directory visualizer'
arch=('x86_64')
url='https://github.com/ICanOnlySuffer/ptree'
license=('MIT')
groups=('pocha')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('5fdd909e2ac2fab149d08c52aeeda317c0088176')

package () {
	cd $pkgname-$pkgver
	make DESTDIR=$pkgdir install
}

