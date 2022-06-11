# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.3.1
pkgrel=1
pkgdesc="Use any linux distribution inside your terminal."
arch=('any')
url="https://github.com/89luca89/distrobox"
license=('GPL3')
optdepends=(
  'docker: enable docker usage'
  'podman: enable podman usage'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./install -P "${pkgdir}/usr"
}

sha256sums=('22b6625ca243f55c08630d37015cdbfbe1939516022bfef502aa6603f42b4d00')
