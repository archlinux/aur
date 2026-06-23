# Maintainer: gralito <gralito@protonmail.com>
pkgname=upyay
pkgver=4.0.1
pkgrel=1
pkgdesc="A yay wrapper written in bash."
arch=('x86_64')
url="https://github.com/gralito/upyay"
license=('MIT')
depends=('yay' 'moreutils' 'dunst' 'nvim')
provides=('upyay')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gralito/upyay/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# install files
	install -Dm755 upyay.sh "$pkgdir/usr/local/bin/upyay"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 upyay.conf "$pkgdir/home/$USER/.config/$pkgname/upyay.conf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
