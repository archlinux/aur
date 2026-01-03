# Maintainer: dan361 <daniel@m8t.io>
pkgname=lowfi-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="An extremely simple lofi player."
arch=('x86_64')
url="https://github.com/talwat/lowfi"
license=('MIT')
provides=('lowfi')
conflicts=('lowfi')
source=("https://github.com/talwat/lowfi/releases/download/${pkgver}/lowfi-linux-x86_64")
sha256sums=('0ad4d40a7e9a03deb842420e4c86fb305c2192a82a72d020887cb108e31998bd')

package() {
  cd "${srcdir}"

  install -Dm755 lowfi-linux-x86_64 "${pkgdir}/usr/bin/lowfi"
}
