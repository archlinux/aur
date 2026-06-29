# Maintainer: hyperpuncher

pkgname=iq-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Interactive jq REPL"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/iq"
license=('MIT')
provides=('iq')
conflicts=('iq')

source_x86_64=("iq::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-x64")
sha256sums_x86_64=('05933740726d23f744c63bd282216c7267ffbb5f63faedbf87c1f901f1cd39b6')

source_aarch64=("iq::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-arm64")
sha256sums_aarch64=('98b7c14d2d85c470546b5748bd440eb9a9bedbbd656d14602405afdbf79122c2')

package() {
  install -Dm755 "$srcdir/iq" "$pkgdir/usr/bin/iq"
}
