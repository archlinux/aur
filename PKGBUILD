# Maintainer: Stan-breaks <stanleymwendwa03@email.com>
pkgname=ytsurf
pkgver=2.0.1
pkgrel=1
pkgdesc="Search and play YouTube videos from the terminal using fzf or rofi and mpv"
arch=('any')
url="https://github.com/Stan-breaks/ytsurf"
license=('GPL-3.0-or-later')
depends=('bash' 'yt-dlp' 'jq' 'curl' 'mpv' 'fzf' 'chafa' 'ffmpeg')
optdepends=(
	'rofi: GUI launcher alternative to fzf'
  'sentaku: A  minimalist selecter alternative'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stan-breaks/ytsurf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9cb5af381d2f5822e40040d051bc26354c7847c66ccd0a0ac5b57a0cc21319c')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ytsurf.sh "$pkgdir/usr/bin/ytsurf"
}
