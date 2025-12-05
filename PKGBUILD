# Maintainer: Stan-breaks <stanleymwendwa03@email.com>
pkgname=ytsurf
pkgver=3.0.2
pkgrel=2
pkgdesc="YouTube in your terminal. Clean and distraction-free."
arch=('any')
url="https://github.com/Stan-breaks/ytsurf"
license=('GPL-3.0-or-later')
depends=('bash' 'yt-dlp' 'jq' 'curl' 'mpv' 'fzf' 'chafa' 'ffmpeg')
optdepends=(
	'rofi: GUI launcher alternative to fzf'
  'sentaku: A  minimalist selecter alternative'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stan-breaks/ytsurf/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c55291df456f3a2f504e52c90ae380287599e2c50e2b33ee98dbef536936c943')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ytsurf.sh "$pkgdir/usr/bin/ytsurf"
}
