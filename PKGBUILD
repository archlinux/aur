# Maintainer: haha662 <haha662 at outlook dot com>

_origname=glowing-bear
pkgname=glowing-bear-web
pkgver=0.9.0
pkgrel=2
pkgdesc="A web client for WeeChat"
arch=("any")
url="https://github.com/glowing-bear/glowing-bear"
license=("GPL3")
depends=()
# If want to host js files locally
# makedepends=("npm" "bower" "git")
optdepends=()
source=("https://github.com/glowing-bear/glowing-bear/archive/${pkgver}.tar.gz")
sha256sums=("9ff5370b4d384b1d7fff77ed5c46014cb2733f14f5032096f4acfdf6a4d0cf63")

build() {
  cd "${srcdir}"/${_origname}-${pkgver}

  # If want to host js files locally
  # npm run make-local
}

package() {
  install -d "${pkgdir}"/usr/share/webapps/${_origname}
  cp -R "${srcdir}"/${_origname}-${pkgver}/* "${pkgdir}"/usr/share/webapps/${_origname}
}