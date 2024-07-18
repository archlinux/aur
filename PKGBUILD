# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Jonian Guveli <https://github.com/jonian/>

pkgver=8.15.9
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
sha256sums=('757f83624849d1bc83c83876d3b34db5f891d0d0aed87fa1998e008f3df42434')

package() {
  install -D "${srcdir}/pnpm-${pkgver}" "${pkgdir}/usr/bin/pnpm"
  chmod +x "${pkgdir}/usr/bin/pnpm"
}
