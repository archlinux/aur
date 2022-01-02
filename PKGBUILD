# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.2.9
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
  mkdir -p "${pkgdir}/usr/bin"
  ./install -p "${pkgdir}/usr/bin"
}

sha256sums=('643c3e91a8e687d2887b4d3ab7d061165eb1f690434abbde4150840e37b2b194')
