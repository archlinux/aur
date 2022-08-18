#Maintainer: solisinvictum https://github.com/solisinvictum/vidoas
pkgname="vidoas"
pkgver="1.0"
pkgrel="1.0"
pkgdesc="vidoas - safely edit the doas.conf file (like visudo for doas)"
arch=("any")
source=("git+https://github.com/solisinvictum/vidoas.git")
url="https://github.com/solisinvictum/vidoas"
sha512sums=("SKIP")
depends=(opendoas)

package() {

  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/vidoas/vidoas" "${pkgdir}/usr/bin/vidoas"
  chmod +x "${pkgdir}/usr/bin/vidoas"

}
