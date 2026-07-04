# Maintainer: hyperpuncher

pkgname=iq-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Interactive jq REPL"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/iq"
license=('MIT')
provides=("iq=$pkgver")
conflicts=('iq')

source_x86_64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-x64")
sha256sums_x86_64=('a4e18952379633ae4a1712f85910d939fd3c74ae457603fbd351df55b5a0f46f')

source_aarch64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-arm64")
sha256sums_aarch64=('85a7e8ddc6420c0faa6c80ed6e429affe03134e49c98641fe4a93f34edfbfbe7')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/iq"
}
