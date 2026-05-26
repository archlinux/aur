# Maintainer: James King <james@jamesking.dev>

pkgname=laravel-moat
pkgver=1.0.4
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
sha256sums_x86_64=('dc61680aa95ca5aef1e08ba8db163ed59e76bd39016fa07c55d9dd4af9467076')
sha256sums_aarch64=('353e4162427f91d2a9272f39732a92d1752c11a8c82be7ab2a1f3916c2e81580')

package() {
  install -Dm755 "$srcdir"/*/moat "$pkgdir/usr/bin/moat"
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
