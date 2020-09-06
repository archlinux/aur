# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='form-extractor'
pkgver=2.8
pkgrel=2
pkgdesc='Extract form tags from html'
arch=('any')
url='https://www.timedicer.co.uk/programs/help/form-extractor.sh.php'
license=('APACHE')
source=("${pkgname}-${pkgver}::https://www.timedicer.co.uk/programs/${pkgname}.sh")
sha256sums=('SKIP')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: ts=2 sw=2 et:
