# Maintainer: Ryan Cragun <me@ryan.ec>
# http://packages.chef.io/files/stable/habitat/latest/manifest.json
pkgname=habitat-bin
pkgver=1.5.86
_pkgrelease=20200408002109
pkgrel=1
pkgdesc="Application automation framework that allows you to build applications that have automation built-in"
arch=('x86_64')
url="https://www.habitat.sh/"
license=('Apache')
provides=('habitat')
conflicts=('habitat' 'habitat-git')
source=("https://packages.chef.io/files/habitat/${pkgver}/hab-${arch}-linux.tar.gz")
sha256sums=('0fef1230e454a70e66f5d084dbc0be1ae4b0e981cb2782d820f24a30a203c842')
package() {
  install -D -m755 "${srcdir}/hab-${pkgver}-${_pkgrelease}-${arch}-linux/hab" "${pkgdir}/usr/bin/hab"
}
