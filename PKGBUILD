# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=lollipops-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Lollipop-style mutation diagrams for annotating genetic variations"
arch=('any')
url=https://github.com/pbnjay/lollipops
license=('GPL3')
provides=('lollipops')
conflicts=('lollipops')
options=(!emptydirs)
source=(https://github.com/pbnjay/"${pkgname//-bin/}"/releases/download/v"${pkgver}"/"${pkgname//-bin/}"-v"${pkgver}"-linux64.tar.gz)
sha256sums=('8f007204b00595ec750e1eee93ebcfa1522867d4387aaef4f24cfe56d5991bbb')

package() {
  cd "${srcdir}"/"${pkgname//-bin/}"-v"${pkgver}"-linux64
  install -Dm655 README.md "${pkgdir}"/usr/share/doc/"${pkgname//-bin/}"/README.md
  install -Dm655 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname//-bin/}"/LICENSE
  install -Dm755 "${pkgname//-bin/}" "${pkgdir}"/usr/bin/"${pkgname//-bin/}"
}
