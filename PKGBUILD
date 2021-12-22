# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.2.3
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

sha256sums=('ea9deccbd579922d22f6bc9f42494c8db0dd45a13ac4efa4e7fb619f46795166')
