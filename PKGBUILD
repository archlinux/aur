# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=graphpath
pkgver=1.2
pkgrel=1
pkgdesc="Generates an ASCII network diagram from the route table"
arch=('any')
url='https://github.com/ocochard/graphpath'
license=('BSD')
depends=('sh')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ocochard/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fc13f0fdfec7660e6b5d18aec446035f89b64102088f019c30684d312f3485c3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm775 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
