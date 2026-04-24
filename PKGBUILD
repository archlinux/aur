# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.19.0
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('d8d880e3155f9da708be8f7c5e6acd54f96ac017b439bc9416c0b475dcbfb7b8')
sha256sums_aarch64=('fb66a71fecaedf9e3a2799578ec88e1f2860293ef5cee4eb9910fcbbc49f179a')

build() {
  return 0
}

package() {
  conflicts=("solv")

  install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
