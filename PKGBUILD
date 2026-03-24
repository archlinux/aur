# Maintainer: Zachary Fogg <me@zfo.gg>
pkgname=vite-plus-bin
pkgver=0.1.14
pkgrel=1
pkgdesc="The Unified Toolchain for the Web"
arch=('x86_64')
url="https://github.com/voidzero-dev/vite-plus"
license=('MIT')
depends=('nodejs')
source=("https://registry.npmjs.org/@voidzero-dev/vite-plus-cli-linux-x64-gnu/-/vite-plus-cli-linux-x64-gnu-${pkgver}.tgz")
sha256sums=('d1fbf589d3436f472c3fb53636d5b7dcd7393278093fa0e2e017539c5637f9e2')

package() {
  # Extract and install the binary from the npm package
  install -Dm755 "${srcdir}/package/vp" "${pkgdir}/usr/bin/vp"
}
