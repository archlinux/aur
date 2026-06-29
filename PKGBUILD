# Maintainer: hyperpuncher

pkgname=iq-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Interactive jq REPL"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/iq"
license=('MIT')
provides=('iq')
conflicts=('iq')

source_x86_64=("iq::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-x64")
sha256sums_x86_64=('0d6579c015580efb0abf522f922299c82fb3d13a42fc67622951fa6f139d5d60')

source_aarch64=("iq::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-arm64")
sha256sums_aarch64=('2b006a266e3c459e1b73fc158d58ebaec0664d2204e6d55ec7f9bee70f9ea97c')

package() {
  install -Dm755 "$srcdir/iq" "$pkgdir/usr/bin/iq"
}
