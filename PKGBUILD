# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
pkgname=enhancd
pkgver=2.5.1
pkgrel=1
pkgdesc="A next-generation cd command with your interactive filter "
arch=(any)
url="https://github.com/babarot/enhancd"
license=('MIT')
install=$pkgname.install
source=("https://github.com/babarot/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('93a3b935a9e9d9e7201827e7b45ee52df8eb77caf4bd93552f8fecc5fb634e28')

package() {
	mkdir -p $pkgdir/usr/share/enhancd/
	mv $pkgname-$pkgver/* "$pkgdir/usr/share/enhancd/"
}
