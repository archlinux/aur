# Maintainer: Stan-breaks <stanleymwendwa03@email.com>
pkgname=ytsurf
pkgver=1.9.5
pkgrel=1
pkgdesc="Search and play YouTube videos from the terminal using fzf or rofi and mpv"
arch=('any')
url="https://github.com/Stan-breaks/ytsurf"
license=('GPL-3.0-or-later')
depends=('bash' 'yt-dlp' 'jq' 'curl' 'mpv' 'fzf' 'xh' 'chafa')
optdepends=(
	'rofi: GUI launcher alternative to fzf'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stan-breaks/ytsurf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('df667bde0805e1d145e29358e557c03819c90a6bbd7b768f199f6ef05be58abd')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ytsurf.sh "$pkgdir/usr/bin/ytsurf"
}
