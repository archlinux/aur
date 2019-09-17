# Maintainer: Ryan Cragun <me@ryan.ec>

pkgname=habitat-bin
pkgver=0.85.0
_builddate=20190916214648

pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://dl.bintray.com/habitat/stable/linux/${arch}/hab-${pkgver}-${_builddate}-${arch}-linux.tar.gz")
sha256sums=('2e526f81316b921b4689354c29ceb0e6df1a734554f63f8873e6ff0adf0efd4a')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
