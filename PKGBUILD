# Maintainer: Fabio Zanini <fabio _DOT zanini AT_ fastmail DOT_ fm>
pkgname=prodigal
pkgver=2.6.3
pkgrel=1
pkgdesc='Fast, reliable protein-coding gene prediction for prokaryotic genomes.'
arch=('i686' 'x86_64')
url="https://github.com/hyattpd/Prodigal"
license=('GPL3')
source=("https://github.com/hyattpd/Prodigal/releases/download/v${pkgver}/prodigal.linux")
md5sums=('af50e3d4a65150a2eb6e3171a669dacf')
options=('!emptydirs')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/bin
  install -m755 prodigal.linux "${pkgdir}"/usr/bin/prodigal

}
