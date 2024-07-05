# Maintainer: egoroff <egoroff@gmail.com>
pkgname=solv-bin
pkgver=0.16.5
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="SOLution Validation tool that analyzes Microsoft Visual Studio solutions (binary release)"
url="https://github.com/aegoroff/solv"
license=('MIT')
source_x86_64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/aegoroff/solv/releases/download/${pkgver}/solv-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('39ac78e65652ed2512c9e2991a5750fd9029e039064b9d79bedcaa1408424f0f')
sha256sums_aarch64=('0681aee6c9e2bd077b75ed9686da6f14b8eda0589f474d964af39fe7ecb12e9d')

build() {
  return 0
}

package() {
  conflicts=("solv")

  install -Dm0755 "solv" "$pkgdir/usr/bin/solv"
  install -Dm0644 "LICENSE.txt" "$pkgdir/usr/share/licenses/solv/LICENSE.txt"
}
