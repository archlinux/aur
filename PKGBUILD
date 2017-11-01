# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=mosdepth
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing"
arch=('i686' 'x86_64')
url="https://github.com/brentp/mosdepth"
license=('MIT')
depends=('')
provides=('mosdepth')
conflicts=('mosdepth')
source=(https://github.com/brentp/"${pkgname}"/releases/download/v"${pkgver}"/"${pkgname}")
md5sums=('9a718afa538e81a0dc4dfb9b714955a2')

package() {
  mkdir -p "${pkgdir}"/usr/bin/

  cp "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  chmod +x "${pkgdir}"/usr/bin/"${pkgname}"
}
