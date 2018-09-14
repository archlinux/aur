# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=habitat-bin
pkgver=0.62.1
_builddate=20180905002037
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://dl.bintray.com/habitat/stable/linux/${arch}/hab-${pkgver}-${_builddate}-${arch}-linux.tar.gz")
sha256sums=('48ba56253e66f78a2011471806dd90ca957ec4a00fc19f9c047f33b7b55ff70f')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
