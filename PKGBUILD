# Maintainer: Anirudh Panchangam Ranganath <anirudhpr.apachi@gmail.com>
pkgname=wpset
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple, interactive wallpaper selector for GNOME desktops with menu interface and random wallpaper feature."
arch=('any')
url="https://github.com/anipr2002/wpset"
license=('MIT')
depends=('gum' 'fzf' 'gnome-desktop')
optdepends=('kitty: for image previews in the terminal')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d9967b70d62fe0c1b1866e9edb29cf1bf8fd5600da195478f0b25ebccb9d5782')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 wpset "$pkgdir/usr/bin/wpset"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
} 
