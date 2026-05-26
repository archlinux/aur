# Maintainer: James King <james@jamesking.dev>

pkgname=laravel-moat
pkgver=1.0.4
pkgrel=1
pkgdesc='Moat reviews the security posture of your GitHub organization and repositories, then surfaces recommendations to consider.'
arch=('x86_64' 'aarch64')
url='https://github.com/laravel/moat'
license=('MIT')
depends=('gcc-libs')
source=("https://raw.githubusercontent.com/laravel/moat/0.x/LICENSE.md")
source_x86_64=("https://github.com/laravel/moat/releases/download/v$pkgver/moat-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/laravel/moat/releases/download/v$pkgver/moat-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')
sha256sums_x86_64=('dc61680aa95ca5aef1e08ba8db163ed59e76bd39016fa07c55d9dd4af9467076')
sha256sums_aarch64=('353e4162427f91d2a9272f39732a92d1752c11a8c82be7ab2a1f3916c2e81580')

package() {
  install -Dm755 "$srcdir"/*/moat "$pkgdir/usr/bin/moat"
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
