# Maintainer: Trevor Bramble <inbox@trevorbramble.com>
# Maintainer: Ryan Cragun <me@ryan.ec>

pkgname=habitat-bin
pkgver=0.77.0
_builddate=20190301212334
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://dl.bintray.com/habitat/stable/linux/${arch}/hab-${pkgver}-${_builddate}-${arch}-linux.tar.gz")
sha256sums=('1254ed70eff6f62f3a3ac7c241dc8a2b59cb66e6ff38670d7c6786b1d259f9eb')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
