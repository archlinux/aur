# Maintainer: Trevor Bramble <inbox@trevorbramble.com>
# Maintainer: Ryan Cragun <me@ryan.ec>

pkgname=habitat-bin
pkgver=0.81.0
_builddate=20190507225645
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://dl.bintray.com/habitat/stable/linux/${arch}/hab-${pkgver}-${_builddate}-${arch}-linux.tar.gz")
sha256sums=('168dbdfc0f701635d23f3ff324e4d0cd78cc3db180f6eb7fe743e93ef1aab209')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
