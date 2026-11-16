# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=fluentci
pkgver=0.17.7
pkgrel=1
pkgdesc="Set up and run your CI locally or in any CI Provider in a consistent way"
arch=('x86_64' 'aarch64')
url="https://github.com/fluentci-io/fluentci"
license=('MPL-2.0')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ec5fe243e67106aea56c7be911addb66c1e5eca3c265db203d7b8cc2635eff8d')
sha256sums_aarch64=('e26a0f8b20351fe2c6b25e6cc1c490aa67908ca6d0a4f436999d83007f0a517f')
options=('!strip') # stripping breaks the binary

package() {
  install -D -m 755 -t "${pkgdir}/usr/bin" "$srcdir/$pkgname"
}
