# Maintainer: Stan-breaks <stanleymwendwa03@email.com>
pkgname=ytsurf
pkgver=3.1.2
pkgrel=1
pkgdesc="YouTube in your terminal. Clean and distraction-free."
arch=('any')
url="https://github.com/Stan-breaks/ytsurf"
license=('GPL-3.0-or-later')
depends=('bash' 'yt-dlp' 'jq' 'curl' 'mpv' 'fzf' 'chafa' 'ffmpeg' 'perl')
optdepends=(
	'rofi: GUI launcher alternative to fzf'
  'sentaku: A  minimalist selecter alternative'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stan-breaks/ytsurf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7dfa675fa4b0479587b1c9dee11165f7739387a68fc2a9b7a4e854c963bd4ff1')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ytsurf.sh "$pkgdir/usr/bin/ytsurf"
}
