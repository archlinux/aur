# Maintainer: Tsuru <tsuru@g.globo>

pkgname='tsuru-bin'
pkgver=1.10.4
pkgrel=1
pkgdesc='tsuru-client is a tsuru command line tool for application developers.'
url='https://tsuru.io'
arch=('x86_64')
license=('BSD-3-Clause')
provides=('tsuru')
conflicts=('tsuru')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/tsuru/tsuru-client/releases/download/${pkgver}/tsuru_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('2b84500621ec583ef11f38b5b52a785db045791523bf21555b0c3083094b6238')

package() {
  install -Dm755 "./tsuru" "${pkgdir}/usr/bin/tsuru"
}
