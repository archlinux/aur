# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.1.2
pkgrel=2
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

sha256sums=('3420f39e489f2025b701e2ac7d24b51f2158e53d9f5f8090f3100163b531f0dc')
