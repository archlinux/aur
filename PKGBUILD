# Maintainer:  Thomas Girod <tgirod@altu.fr>
 
pkgname="zine-bin"
_pkgname="zine"
pkgver=0.10.2
pkgrel=1
pkgdesc="Fast, Scalable, Flexible Static Site Generator (SSG)"
arch=('x86_64')
url="https://zine-ssg.io"
_url="https://github.com/kristoff-it/${_pkgname}"
license=('MIT')
depends=()
makedepends=()
source=("${_url}/releases/download/v${pkgver}/x86_64-linux-musl.tar.xz")

package() {
  cd "${srcdir}"
  install -vDm755 "zine" "${pkgdir}/usr/bin/zine"
}
sha256sums=('6733d370e4a7011d71f06962d4e72e303ca3d2f648ad455c4cb8cebcea71a0c2')
