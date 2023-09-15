# Maintainer: Jothi Prasath <jothiprasath2@gmail.com>
pkgname=bun-termux
pkgver=1.0.2
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, test runner, and package manager – all in one"
arch=('aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
depends=('glibc')
source=("https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip")
sha256sums=('SKIP')

package() {

  bsdtar -xf "${srcdir}/bun-linux-aarch64.zip"

  mv "${srcdir}/bun-linux-aarch64/bun" "${PREFIX}/bin/bun"
  
}
