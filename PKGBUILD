# Maintainer: Keith Cirkel <keithamus@users.noreply.github.com>
pkgname=csskit-bin
pkgver=0.0.42
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
sha256sums_x86_64=('6b4c94a69f980a59e893d56e3aa692ecdb30adc06b70d374e2a505ed3aef6207')
sha256sums_aarch64=('0fae1969e9f7ac40c44ec5713f34a4a340f273d1ec378c4f42465e101f171e0f')

package() {
  install -Dm755 "$srcdir/csskit-$pkgver-$CARCH" "$pkgdir/usr/bin/csskit"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
