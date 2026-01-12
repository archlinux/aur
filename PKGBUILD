# Maintainer: chabandou <chabandou@gmail.com>
pkgname=poise-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Real-time system audio denoiser and voice isolator with TUI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/chabandou/Poise-Voice-Isolator"
license=('MIT')
depends=(
    'glibc'
    'libpulse'
)
provides=('poise')
conflicts=('poise')
source=("poise-$pkgver::$url/releases/download/v$pkgver/poise")
sha256sums=('0fedbba46d350d9612dc0d3aab81169bbe90212886ae2425c14ba2abcc4abfa9')

package() {
    install -Dm755 "$srcdir/poise-$pkgver" "$pkgdir/usr/bin/poise"
}
