# Maintainer: rokuroo171 <mrakkakhairilazwar@gmail.com>
pkgname=raind-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal weather screensaver with four modes: rain, thunder, snow, meteor (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rokuroo171/raind"
license=('MIT')
provides=('raind')
conflicts=('raind')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/rokuroo171/raind/releases/download/v$pkgver/raind_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/rokuroo171/raind/releases/download/v$pkgver/raind_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1a45834209e93dbf846e520a4809530d29c68026e5aa24944d42475cb30419ad')
sha256sums_aarch64=('4e47dcf776228a5c2f562e9e620dac87a75a98c0048e7f1b26d25c4e72eae850')

package() {
  install -Dm755 raind "$pkgdir/usr/bin/raind"
  install -Dm644 README.md "$pkgdir/usr/share/doc/raind/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
