# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Baptiste Daroussin <baptiste.daroussin@gmail.com>

pkgname=pkgextract
pkgver=0.2
pkgrel=3
pkgdesc="This script extracts rpm and deb archives"
arch=('any')
url="http://www.archlinux.org"
license=('unknown')
depends=('libarchive')
source=(pkgextract.sh)
md5sums=('5726aa04ab52bdf1a1ea7c1954e20f85')

package() {
  cd "${srcdir}"

  install -D -m755 "${srcdir}"/pkgextract.sh "${pkgdir}"/usr/bin/pkgextract.sh
}
