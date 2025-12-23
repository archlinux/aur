# Maintainer: Stan-breaks <stanleymwendwa03@email.com>
pkgname=ytsurf
pkgver=3.0.6
pkgrel=1
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
sha256sums=('8fb114e175214e9bf647914cf6eb080c549a48c6ca2fe2f1ed503a62ae1ea335')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ytsurf.sh "$pkgdir/usr/bin/ytsurf"
}
