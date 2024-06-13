# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.16.3
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('bb879e14f0a0b2acef31f759edfc09b5ef9f1f8003343a9c617d6937232cf32b')
sha256sums_aarch64=('0236010d8366b49cc63c6cef53f81eaaefb7ad477addf64790da9a1621000d22')

build() {
  return 0
}

package() {
  conflicts=("solv")

  install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
