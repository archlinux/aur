# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.2.1
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

sha256sums=('5a9dfc974ea154dfc0a5ba5600d9ea4206d4011d97f9aeeda2a7aaab42f823d7')
