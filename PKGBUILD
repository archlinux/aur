# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=fluentci
pkgver=0.17.6
pkgrel=1
pkgdesc="Set up and run your CI locally or in any CI Provider in a consistent way"
arch=('x86_64' 'aarch64')
url="https://github.com/fluentci-io/fluentci"
license=('MPL-2.0')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('769849d75d60c5e585f0c194de2f68fc7d08ace2b4c421e04fa3423cd1b75979')
sha256sums_aarch64=('2ef3d3147bf2bb86a3323234a67e6e583b25300ce02d33d83ca22e3031d4fabb')
options=('!strip') # stripping breaks the binary

package() {
  install -D -m 755 -t "${pkgdir}/usr/bin" "$srcdir/$pkgname"
}
