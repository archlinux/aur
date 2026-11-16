# Maintainer: Keith Cirkel <keithamus@users.noreply.github.com>
pkgname=csskit-bin
pkgver=0.0.39
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
sha256sums_x86_64=('59c2250c068264288459bce3a7ba3ad9fb4de8559d5abbf60a9db6709016c3d4')
sha256sums_aarch64=('76caabddf366e078a8b252aff88f505aea274b6eca35cad674c18d6d5b61deef')

package() {
  install -Dm755 "$srcdir/csskit-$pkgver-$CARCH" "$pkgdir/usr/bin/csskit"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
