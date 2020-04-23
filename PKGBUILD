# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=orange-cat-bin
pkgver=0.2.2
pkgrel=1
pkgdesc='A Markdown previewer written in Go'
arch=('x86_64')
url="https://github.com/utatti/orange-cat"
license=('MIT')
provides=('orange-cat' 'orange')
source=("https://github.com/utatti/orange-cat/releases/download/v${pkgver}/orange_linux_amd64.zip")
sha256sums=('34ab47cf6c633d5cd1e5284f8b233cc2c97599d592c15bc56481ca269b069e35')

package() {
  install -Dm755 "${srcdir}/orange" -t "${pkgdir}/usr/bin"
}
# vim:set ts=2 sw=2 et: