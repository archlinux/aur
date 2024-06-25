# Maintainer: Serge K <arch@phnx47.net> 
# Contributor: Jonian Guveli <https://github.com/jonian/>

pkgver=8.15.8
pkgrel=1
pkgname="pnpm8-bin"
pkgdesc="Fast, disk space efficient package manager"
arch=("x86_64")
url="https://github.com/pnpm/pnpm"
license=("MIT License")
options=("!strip")
provides=("pnpm=${pkgver}")
conflicts=("pnpm")
source=("pnpm-${pkgver}::${url}/releases/download/v${pkgver}/pnpm-linux-x64")
sha256sums=('d769ede238f9eafaf96ff4373801e235e2507f5422a38f734318e355fa8b5434')

package() {
  install -D "${srcdir}/pnpm-${pkgver}" "${pkgdir}/usr/bin/pnpm"
  chmod +x "${pkgdir}/usr/bin/pnpm"
}
