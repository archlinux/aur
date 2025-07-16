# Maintainer: Anirudh Panchangam Ranganath <anirudhpr.apachi@gmail.com>
pkgname=wpset
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple, interactive wallpaper selector for GNOME desktops."
arch=('any')
url="https://github.com/anipr2002/wpset"
license=('MIT')
depends=('gum' 'fzf' 'gnome-desktop')
optdepends=('kitty: for image previews in the terminal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('57e658996f5377fc061011aab5fe639a88dc3ce4bd727046f2bbffb36bba8324')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 wpset "$pkgdir/usr/bin/wpset"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
} 
