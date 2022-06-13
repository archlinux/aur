# Maintainer: Piero Estéfano Rojas Effio <pierorojas@tutamail.com>

pkgname='ptv'
pkgver=1.6.1
pkgrel=1
pkgdesc='A tree directory visualizer program'
arch=('x86_64' 'armv7a')
makedepends=('pul')
license=('GPLv3')
groups=('pocha')
url="https://gitlab.com/ICanOnlySuffer/$pkgname"

source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('2282d33b8953d016ac48cbcdb0ace251c4a10f1fbcb1c871aa38d5d7296d459d')

package () {
	make -C $pkgname-v$pkgver install clean INSTALL_DIR=$pkgdir
}

