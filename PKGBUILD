# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=mosdepth
pkgver=0.2.1
pkgrel=1
pkgdesc="Fast BAM/CRAM depth calculation for WGS, exome, or targeted sequencing"
arch=('i686' 'x86_64')
url="https://github.com/brentp/mosdepth"
license=('MIT')
provides=('mosdepth')
conflicts=('mosdepth')
source=(https://github.com/brentp/"${pkgname}"/releases/download/v"${pkgver}"/"${pkgname}")
md5sums=('18f7eebecb3d09df170a8c2d925e24f0')

package() {
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
}
