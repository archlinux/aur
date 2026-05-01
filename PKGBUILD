# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.21.1
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('6f334e767eacd1b0dc0a54f2ec1627e717c05a99b5f47080df4b07573af79eab')
sha256sums_aarch64=('22f4554d714b650f55c4fa99bb8cf533e5f56dc183c35e6747c851fe8174284b')

build() {
  return 0
}

package() {
  conflicts=("solv")

  install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
