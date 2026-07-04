# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.22.0
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('088bb511712dae9abbcf8b61bb352c0830a7aad17bf33a292d38b122eb9962ca')
sha256sums_aarch64=('52c65c314bd95f2013f3a290bd91cfb9aa9e6209c918034774b82bc928e2a602')

build() {
  return 0
}

package() {
  conflicts=("solv")

  install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
