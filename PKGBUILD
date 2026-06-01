# Maintainer: James King <james@jamesking.dev>

pkgname=laravel-moat
pkgver=1.0.6
pkgrel=1
pkgdesc='Moat reviews the security posture of your GitHub organization and repositories, then surfaces recommendations to consider.'
arch=('x86_64' 'aarch64')
url='https://github.com/laravel/moat'
license=('MIT')
depends=('gcc-libs')
source=("https://raw.githubusercontent.com/laravel/moat/1.x/LICENSE.md")
source_x86_64=("https://github.com/laravel/moat/releases/download/v$pkgver/moat-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/laravel/moat/releases/download/v$pkgver/moat-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7b4f9149597fbae2ce689bc9317d1869e17f1b3fa5f01c289998c108f8c37cf7')
sha256sums_x86_64=('9cf55291b154ddc0eec14fbda0082536ffca7a9d40ed74c0ecc1b9cebac4e013')
sha256sums_aarch64=('dff9a89bb3f1d4ae2a73536a4796f220fe51d47f4d3328db325933adf7ebdbe2')

package() {
  install -Dm755 "$srcdir"/*/moat "$pkgdir/usr/bin/moat"
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
