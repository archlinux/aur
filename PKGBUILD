# Maintainer: starkSV <shekharvaidya2@gmail.com>
pkgname=msdl-bin
pkgver=0.3.7
pkgrel=1
pkgdesc="Download Windows ISO files directly from Microsoft's servers"
arch=('x86_64' 'aarch64')
url="https://msdl.tech-latest.com"
license=('MIT')
provides=('msdl')
conflicts=('msdl')

source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/starkSV/windows-iso-downloader/releases/download/cli%2Fv${pkgver}/msdl-linux-amd64")
sha256sums_x86_64=('4714f47044814733ca2e20ae8f64327ad0b71b912d6fe6f677f18c90b3a5f1c0')

source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/starkSV/windows-iso-downloader/releases/download/cli%2Fv${pkgver}/msdl-linux-arm64")
sha256sums_aarch64=('9059678043de3995f67ddc3083badf674b572d9bba8e8118e511f57d1f80d3eb')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/msdl"
}
