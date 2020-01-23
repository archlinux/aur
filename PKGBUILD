# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=cljstyle-bin
pkgver=0.11.1
pkgrel=1
pkgdesc='A tool for formatting Clojure code'
arch=('x86_64')
url='https://github.com/greglook/cljstyle'
license=('EPL')
provides=('cljstyle')
conflicts=('cljstyle')

source=("https://github.com/greglook/cljstyle/releases/download/${pkgver}/${pkgname/\-bin/}_${pkgver/_/-}_linux.tar.gz")

sha256sums=('690b408fbabfc8e838544a5438c3d6dbf456962be410a4c858697c48ae8dc9b4')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-bin/}" "${pkgdir}/usr/bin/${pkgname/\-bin/}"
}
