# Maintainer: Ryan Cragun <me@ryan.ec>
# http://packages.chef.io/files/stable/habitat/latest/manifest.json
pkgname=habitat-bin
pkgver=1.6.115
_pkgrelease=20200806220545
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://packages.chef.io/files/habitat/${pkgver}/hab-${arch}-linux.tar.gz")
sha256sums=('3a4d947e683e6d70b907d1135d538d0b8478da18f0b05a8798307157ad286298')
package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_pkgrelease}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
