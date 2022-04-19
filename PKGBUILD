# Maintainer: robertfoster

pkgname=distrobox
pkgver=1.2.14
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

sha256sums=('86c7a6515d8548e258b4acb152e4a622f671c4ffcf1cc1a36d05b5f56bc6a0aa')
