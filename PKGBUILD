# Maintainer: dan361 <daniel@m8t.io>
pkgname=lowfi-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="An extremely simple lofi player."
arch=('x86_64')
url="https://github.com/talwat/lowfi"
license=('MIT')
provides=('lowfi')
conflicts=('lowfi')
source=("https://github.com/talwat/lowfi/releases/download/${pkgver}/lowfi-linux-x86_64")
sha256sums=('ed6e799127f6bf2f5f6e2d70b86d8210ca3d97e63f086824972bc7030b99aeeb')

package() {
  cd "${srcdir}"

  install -Dm755 lowfi-linux-x86_64 "${pkgdir}/usr/bin/lowfi"
}
