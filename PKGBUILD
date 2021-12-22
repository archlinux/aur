# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.2.4
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

sha256sums=('d11aa2909823170743d640e0615875215d436a476165d3d8e8dfc42ace4ef55e')
