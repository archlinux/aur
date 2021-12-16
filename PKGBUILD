# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.2.0
pkgrel=1
pkgdesc="Use any linux distribution inside your terminal."
arch=('any')
url="https://github.com/89luca89/distrobox"
license=('GPL3')
depends=('podman')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/bin"
  ./install -p "${pkgdir}/usr/bin"
}

sha256sums=('f669795bf517923cb1d87a0027d69c98bfc1f3ed49fc494a2d4a7683ffd744a1')
