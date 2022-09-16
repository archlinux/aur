# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.4.1
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

sha256sums=('be3266f77011b30da5d0035e246d4e4a9360b7c90fbd8b90ac581165a00217b8')
