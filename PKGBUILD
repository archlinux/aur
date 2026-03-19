# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=vite-plus-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="The Unified Toolchain for the Web"
arch=('x86_64')
url="https://github.com/voidzero-dev/vite-plus"
license=('MIT')
depends=('nodejs')
source=("https://registry.npmjs.org/@voidzero-dev/vite-plus-cli-linux-x64-gnu/-/vite-plus-cli-linux-x64-gnu-${pkgver}.tgz")
sha256sums=('SKIP')

package() {
  # Extract and install the binary from the npm package
  install -Dm755 "${srcdir}/package/vp" "${pkgdir}/usr/bin/vp"
}
