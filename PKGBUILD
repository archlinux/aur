# Maintainer: Keith Cirkel <keithamus@users.noreply.github.com>
pkgname=csskit-bin
pkgver=0.0.37
pkgrel=1
pkgdesc="Refreshing CSS: formatter, minifier, linter and more"
arch=('x86_64' 'aarch64')
url="https://csskit.rs/"
license=('MIT')
provides=('csskit')
conflicts=('csskit')
source=("csskit-bin-$pkgver-LICENSE::https://raw.githubusercontent.com/csskit/csskit/v$pkgver/LICENSE")
source_x86_64=("csskit-$pkgver-x86_64::https://github.com/csskit/csskit/releases/download/v$pkgver/csskit-linux-x64")
source_aarch64=("csskit-$pkgver-aarch64::https://github.com/csskit/csskit/releases/download/v$pkgver/csskit-linux-arm64")
sha256sums=('e95c4e4987388738cf61cd047d63188f5918b3bdfc83ab47d2090debc1c0f577')
sha256sums_x86_64=('7940d3313fc1fee01f9be46fca910c4876cc61f3a430b3806933329f6df264c9')
sha256sums_aarch64=('0f932dea3b4d31a3b5d17a984ac7ac763221e7f87a22edaf920d1cd497a8abe5')

package() {
  install -Dm755 "$srcdir/csskit-$pkgver-$CARCH" "$pkgdir/usr/bin/csskit"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
