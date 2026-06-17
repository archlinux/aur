# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.21.2
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('a112468ef38d105e4a87596b77d2714a2968484931f78f58083df8420909bc85')
sha256sums_aarch64=('3eb53d6e4a75d0c150b85b29a686cca70cec8b9e564febee95252a249f157d9f')

build() {
  return 0
}

package() {
  conflicts=("solv")

  install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
