# Maintainer: franlol
pkgname=gbins-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="GTFOBins in your terminal — fuzzy-search and copy the exploit"
arch=('x86_64' 'aarch64')
url="https://github.com/franlol/gbins"
license=('MIT')
provides=('gbins')
conflicts=('gbins')
options=(!strip)
source_x86_64=("gbins-$pkgver-x86_64.tar.gz::https://github.com/franlol/gbins/releases/download/v0.1.0/gbins-v0.1.0-linux-x64.tar.gz")
source_aarch64=("gbins-$pkgver-aarch64.tar.gz::https://github.com/franlol/gbins/releases/download/v0.1.0/gbins-v0.1.0-linux-arm64.tar.gz")
sha256sums_x86_64=('d1b40446a56307fa45f272b95f4b454b52efa43269b619807bfc855a6a20fda6')
sha256sums_aarch64=('f94bfd5dadb88e342154bb01e9fd0a8b4d76d3fc6b9fd20137fb4396879b7d0a')

package() {
  install -Dm755 "$srcdir/gbins" "$pkgdir/usr/bin/gbins"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
