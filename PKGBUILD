# Maintainer: starkSV <shekharvaidya2@gmail.com>
pkgname=msdl-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="Download Windows ISO files directly from Microsoft's servers"
arch=('x86_64' 'aarch64')
url="https://msdl.tech-latest.com"
license=('MIT')
provides=('msdl')
conflicts=('msdl')

source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/starkSV/windows-iso-downloader/releases/download/cli%2Fv${pkgver}/msdl-linux-amd64")
sha256sums_x86_64=('b99ba65ec9d1d70b40437cc63f66e8a44c82152e2a47efec8d3bd9f0664db17e')

source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/starkSV/windows-iso-downloader/releases/download/cli%2Fv${pkgver}/msdl-linux-arm64")
sha256sums_aarch64=('34de371c70c7cb9bced7de6a0be4d229b3838de432b46ec36c1fc982cbe84109')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/msdl"
}
