pkgname=bun-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("bun-linux-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('3452b900ca1f0bd793f4e3ee8a23df74ebac806997ce1b4ed73a53384ac77561d99a54cd97f8b60b220ffd597ead408f8d12c5e42a26d84e0dfd628a4216e90a')

package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
