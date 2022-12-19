# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.4.2
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

sha256sums=('63a121076ff0a4382faabb544f5ef3cb10f5c400acfd4c53c844bf9e29e7f7e8')
