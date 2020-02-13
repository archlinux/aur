# Maintainer: Ryan Cragun <me@ryan.ec>
# http://packages.chef.io/files/stable/habitat/latest/manifest.json
pkgname=habitat-bin
pkgver=1.5.29
_pkgrelease=20200211160833
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://packages.chef.io/files/habitat/${pkgver}/hab-${arch}-linux.tar.gz")
sha256sums=('bc9b602ee2319f793be8fb60afa7be4f79146ea21fe1e5b124f184ac6968a5cd')
package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_pkgrelease}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
