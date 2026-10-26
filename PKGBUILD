# Maintainer: Keith Cirkel <keithamus@users.noreply.github.com>
pkgname=csskit-bin
pkgver=0.0.36
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
sha256sums_x86_64=('677887b28364ba4ff3954bb490ffaffcdf41600ad4e293eefc80fb8fd21e6fbf')
sha256sums_aarch64=('962e807054e58dfdb0b9197987a94e4818194bb440b4c2035f4f89240b18c052')

package() {
  install -Dm755 "$srcdir/csskit-$pkgver-$CARCH" "$pkgdir/usr/bin/csskit"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
