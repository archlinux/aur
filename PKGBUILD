# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=crane-bin
pkgver=2.11.1
pkgrel=1
pkgdesc='Lift containers with ease'
arch=('x86_64')
url="https://www.crane-orchestration.com"
license=('MIT')
provides=('crane')
source=("https://github.com/michaelsauter/crane/releases/download/v${pkgver}/crane_linux_amd64")
md5sums=('c6314977da994f752713832f17b71666')

package() {
  cd "${srcdir}"
  install -Dm755 crane* "${pkgdir}/usr/bin/crane"
}
# vim:set ts=2 sw=2 et: