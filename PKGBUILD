# Maintainer: Bram Swenson <bram at craniumisajar dot com> PGP-Key: 9E93532D99D643C0

pkgname=dynalist-desktop
pkgver=1.0.2
pkgrel=1
pkgdesc="Dynalist lets you organize your ideas and tasks in simple lists. It's powerful, yet easy to use."
arch=("any")
url="https://dynalist.io"
license=(Private)
makedepends=("tar" "wget")
provides=("dynalist")
source=("dynalist.tar.gz::https://dynalist.io/standalone/download?file=dynalist.tar.gz")
sha256sums=("da2587a8b6e436e0d71aba094c72bbef753cbfe585b95477f08ad7c596a943ee")

pkgver() {
  echo ${pkgver}
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -a dynalist-${pkgver} "${pkgdir}/opt/dynalist" 
  ln -sf "${pkgdir}/opt/dynalist/dynalist" "${pkgdir}/usr/bin/dynalist"
}

# vim:set ts=2 sw=2 et:
