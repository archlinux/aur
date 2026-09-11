# Maintainer: Muhammad Nu'man <numany2k2005@gmail.com>
pkgname=talabulilm
pkgver=0.3.0
pkgrel=1
pkgdesc="Watch Ceramah Ustaz (Islamic lectures) from the terminal, ani-cli style"
arch=('any')
url="https://github.com/numan89/talabulilm"
license=('MIT')
depends=('bash' 'fzf' 'yt-dlp' 'mpv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/numan89/talabulilm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f77ecbdb0a9d6ec852e65c913a9294b38dd78d7edec407ca4ebb321ee6fc951')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 talabulilm "$pkgdir/usr/bin/talabulilm"
	install -Dm644 ustaz_list.txt "$pkgdir/usr/share/talabulilm/ustaz_list.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
