# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.2.15
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

sha256sums=('62a7ee779f605347919157fae947331042b771022c7d7d3169a2bd6ecc8589d7')
