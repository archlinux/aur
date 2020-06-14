# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>

pkgname=cljstyle-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='A tool for formatting Clojure code'
arch=('x86_64')
url='https://github.com/greglook/cljstyle'
license=('EPL')
provides=('cljstyle')
conflicts=('cljstyle')

source=("https://github.com/greglook/cljstyle/releases/download/${pkgver}/${pkgname/\-bin/}_${pkgver/_/-}_linux.tar.gz")

sha256sums=('f6934b94060e834f22403ed7ef6c95c894e450b5b8dd2c8e977e99eaca474636')

package() {
  install -Dm755 "${srcdir}/${pkgname/\-bin/}" "${pkgdir}/usr/bin/${pkgname/\-bin/}"
}
