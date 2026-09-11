# Maintainer: Muhammad Nu'man <numany2k2005@gmail.com>
pkgname=talabulilm
pkgver=0.2.0
pkgrel=1
pkgdesc="Watch Ceramah Ustaz (Islamic lectures) from the terminal, ani-cli style"
arch=('any')
url="https://github.com/numan89/talabulilm"
license=('MIT')
depends=('bash' 'fzf' 'yt-dlp' 'mpv')
source=("$pkgname-$pkgver.tar.gz::https://github.com/numan89/talabulilm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8bb7a780dfdf2afa498415f98a506d889066569ab7b4c906e7656cb501851e99')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 talabulilm "$pkgdir/usr/bin/talabulilm"
	install -Dm644 ustaz_list.txt "$pkgdir/usr/share/talabulilm/ustaz_list.txt"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
