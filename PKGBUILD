# Maintainer: Crymfox <sameur.bh@gmail.com>
pkgname=ytglean-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="YouTube transcript aggregation and digest system with MCP server (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Crymfox/YTGlean"
license=('MIT')
install=ytglean-bin.install
depends=('glibc')
optdepends=('yt-dlp: fallback transcript provider')
provides=('ytglean')
conflicts=('ytglean')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/Crymfox/YTGlean/releases/download/v$pkgver/ytglean_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/Crymfox/YTGlean/releases/download/v$pkgver/ytglean_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "$srcdir/ytglean" "$pkgdir/usr/bin/ytglean"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
