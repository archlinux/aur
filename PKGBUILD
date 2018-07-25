# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=habitat-bin
pkgver=0.58.0
_builddate=20180629144346
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://dl.bintray.com/habitat/stable/linux/${arch}/hab-${pkgver}-${_builddate}-${arch}-linux.tar.gz")
sha256sums=('e6e5ca053ba38b81f9b35cdc595058e374c5b31e9fc69fc87f55631a3910fbb4')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
