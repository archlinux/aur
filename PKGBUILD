# Maintainer: Ryan Cragun <me@ryan.ec>
# http://packages.chef.io/files/stable/habitat/latest/manifest.json
pkgname=habitat-bin
pkgver=1.6.39
_pkgrelease=20200527162613
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://packages.chef.io/files/habitat/${pkgver}/hab-${arch}-linux.tar.gz")
sha256sums=('6aa437e6eded9d32c3d7a11c69caaef893e947237b102cae2ba5c7ed0cc00e18')
package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_pkgrelease}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
