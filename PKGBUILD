# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=imager-bin
pkgver=0.3.4
pkgrel=1
pkgdesc='Automated image compression for efficiently distributing images on the web'
arch=('x86_64')
url="https://imager.io"
license=('MIT')
provides=('imager')
source=("https://github.com/imager-io/imager/releases/download/auto-release/imager/${pkgver}/imager-v${pkgver}-linux.tar.gz")
md5sums=('f196e141fa576c74579089514249767b')

package() {
  install -Dm755 ${srcdir}/linux/bin/imager "${pkgdir}/usr/bin/imager"
}
# vim:set ts=2 sw=2 et: