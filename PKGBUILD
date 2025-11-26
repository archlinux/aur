# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=cljstyle-bin
pkgver=0.17.642
pkgrel=1
pkgdesc='A tool for formatting Clojure code'
arch=('x86_64')
url='https://github.com/greglook/cljstyle'
license=('EPL')
provides=('cljstyle')
conflicts=('cljstyle')

source=("https://github.com/greglook/cljstyle/releases/download/${pkgver}/${pkgname/\-bin/}_${pkgver/_/-}_linux_amd64.zip")

sha256sums=('292e1263f5a119c7af75e941e407bcf841625a627ce8bb40371ab78bf7b57b06')

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname%-bin}"
}
