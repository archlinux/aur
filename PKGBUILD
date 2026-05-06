# Maintainer: Stan-breaks <stanleymwendwa03@email.com>
pkgname=ytsurf
pkgver=3.1.7
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
sha256sums=('ba61e89fc6748c823030dec8406e4c2522aa2bb294db60a141e53b95e6bb0e22')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ytsurf.sh "$pkgdir/usr/bin/ytsurf"
}
