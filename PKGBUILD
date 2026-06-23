# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=devdrop
pkgver=0.1.2
pkgrel=1
pkgdesc="Local-first workspace sync for developers"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/devdrop"
license=('MIT')
depends=('gcc-libs' 'git' 'sqlite' 'openssl')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$url/releases/download/v$pkgver/devdrop-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.tar.gz::$url/releases/download/v$pkgver/devdrop-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('e547d9b73de720190a6ce120fc0685ad40435ceb39065316e998c35de27bb05c')
sha256sums_aarch64=('4659c5407c34a1f21124fc72341d6fb81c1a419626832dfac668791cf59838d5')

package() {
  install -Dm755 devdrop "$pkgdir/usr/bin/devdrop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
