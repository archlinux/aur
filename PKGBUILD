# Maintainer: Stan-breaks <stanleymwendwa03@email.com>
pkgname=ytsurf
pkgver=1.0.0
pkgrel=1
pkgdesc="Search and play YouTube videos from the terminal using fzf or rofi and mpv"
arch=('any')
url="https://github.com/Stan-breaks/ytsurf"
license=('GPL-3.0-or-later')
depends=('bash' 'yt-dlp' 'jq' 'curl' 'mpv' 'fzf' 'chafa')
optdepends=(
	'rofi: GUI launcher alternative to fzf'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stan-breaks/ytsurf/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('299ba98331ec0e62e27700ac8cc0a93ff400f2a7ef4b5dcf17f3249fd93252db') # replace with real checksum if needed

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ytsurf.sh "$pkgdir/usr/bin/ytsurf"
}
