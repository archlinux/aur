# Maintainer: Trevor Bramble <inbox@trevorbramble.com>
# Maintainer: Ryan Cragun <me@ryan.ec>

pkgname=habitat-bin
pkgver=0.78.0
_builddate=20190313115951
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://dl.bintray.com/habitat/stable/linux/${arch}/hab-${pkgver}-${_builddate}-${arch}-linux.tar.gz")
sha256sums=('3bfb6883b64f58d48615a6e4817c66c5abddb45e555cee305a8654abfde29551')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
