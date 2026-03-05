# Maintainer: dan361 <daniel@m8t.io>
pkgname=lowfi-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="An extremely simple lofi player."
arch=('x86_64')
url="https://github.com/talwat/lowfi"
license=('MIT')
provides=('lowfi')
conflicts=('lowfi')
source=("https://github.com/talwat/lowfi/releases/download/${pkgver}/lowfi-linux-x86_64")
sha256sums=('e6d1579bc7ce8840d3d40079ac9571fcd82cca69bf156ee292f93354f334990f')
package() {
  cd "${srcdir}"

  install -Dm755 lowfi-linux-x86_64 "${pkgdir}/usr/bin/lowfi"
}
