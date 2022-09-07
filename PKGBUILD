# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.4.0
pkgrel=2
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

sha256sums=('e643a702c3f3f0d7467afe840b4f3ee6e4c369b6464618b6ec09f7ad27eb64f5')
