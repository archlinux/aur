# Maintainer: David Parrish <daveparrish@tutanota.com>
# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=habitat-bin
pkgver=0.30.2
_builddate=20170822232349
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://dl.bintray.com/habitat/stable/linux/${arch}/hab-${pkgver}-${_builddate}-${arch}-linux.tar.gz")
sha256sums=('4140d930ca0d770dffcc7caaed74558667f1a6c81f80d9f797b69592d6bd4a36')

package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_builddate}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
