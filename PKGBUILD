# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=fluentci
pkgver=0.17.4
pkgrel=1
pkgdesc="Set up and run your CI locally or in any CI Provider in a consistent way"
arch=('x86_64' 'aarch64')
url="https://github.com/fluentci-io/fluentci"
license=('MPL-2.0')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('39ec040ac888feac361051bb359e36bbce154354c3a2469cd0cbcf1f80d5a55e')
sha256sums_aarch64=('99601f5290007c2437ab4120dc9145f9e60bcfe1c1085743995b7a92300c5442')
options=('!strip') # stripping breaks the binary

package() {
  install -D -m 755 -t "${pkgdir}/usr/bin" "$srcdir/$pkgname"
}
