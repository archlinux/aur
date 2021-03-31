# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=cljstyle-bin
pkgver=0.15.0
pkgrel=1
pkgdesc='A tool for formatting Clojure code'
arch=('x86_64')
url='https://github.com/greglook/cljstyle'
license=('EPL')
provides=('cljstyle')
conflicts=('cljstyle')

source=("https://github.com/greglook/cljstyle/releases/download/${pkgver}/${pkgname/\-bin/}_${pkgver/_/-}_linux.tar.gz")

sha256sums=('01082571ced68115fc17c6ddd8bc5c19983c7d8dcd90f48b41795ac44c641c46')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-bin/}" "${pkgdir}/usr/bin/${pkgname/\-bin/}"
}
