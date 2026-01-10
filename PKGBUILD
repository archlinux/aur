# Maintainer: dan361 <daniel@m8t.io>
pkgname=lowfi-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="An extremely simple lofi player."
arch=('x86_64')
url="https://github.com/talwat/lowfi"
license=('MIT')
provides=('lowfi')
conflicts=('lowfi')
source=("https://github.com/talwat/lowfi/releases/download/${pkgver}/lowfi-linux-x86_64")
sha256sums=('8af7dcb9a5853efa56778d9f8156c8426611fdfc0463bec567f08a043553d25a')
package() {
  cd "${srcdir}"

  install -Dm755 lowfi-linux-x86_64 "${pkgdir}/usr/bin/lowfi"
}
