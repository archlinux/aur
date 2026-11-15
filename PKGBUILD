# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=fluentci
pkgver=0.17.5
pkgrel=1
pkgdesc="Set up and run your CI locally or in any CI Provider in a consistent way"
arch=('x86_64' 'aarch64')
url="https://github.com/fluentci-io/fluentci"
license=('MPL-2.0')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('2a271be2af5727b615d86592740842bf9d01d59dfa689727d1aab08d9fccc716')
sha256sums_aarch64=('5770fd80f47148af08251e49803cb48c5814d8d593a58aafaf9c6c0b6b7759f8')
options=('!strip') # stripping breaks the binary

package() {
  install -D -m 755 -t "${pkgdir}/usr/bin" "$srcdir/$pkgname"
}
