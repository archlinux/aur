# Maintainer: James King <james@jamesking.dev>

pkgname=laravel-moat
pkgver=1.0.3
pkgrel=1
pkgdesc='Moat reviews the security posture of your GitHub organization and repositories, then surfaces recommendations to consider.'
arch=('x86_64' 'aarch64')
url='https://github.com/laravel/moat'
license=('MIT')
depends=('gcc-libs')
source=("https://raw.githubusercontent.com/laravel/moat/0.x/LICENSE.md")
source_x86_64=("https://github.com/laravel/moat/releases/download/v$pkgver/moat-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/laravel/moat/releases/download/v$pkgver/moat-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7b4f9149597fbae2ce689bc9317d1869e17f1b3fa5f01c289998c108f8c37cf7')
sha256sums_x86_64=('f1f1f213b56e206f38ee679bc5ea354bba0f24d455e519924badd52f5d8c6896')
sha256sums_aarch64=('bc3893bfa4d131be6488b227d5deb72b396f7a040da4d08031ead98e50ae7cb8')

package() {
  install -Dm755 "$srcdir"/*/moat "$pkgdir/usr/bin/moat"
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
