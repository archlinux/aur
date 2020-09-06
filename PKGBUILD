# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='pdf-compress'
pkgver=0.6
pkgrel=1
pkgdesc='Compress an overlarge pdf file'
arch=('any')
url='https://www.timedicer.co.uk/programs/help/pdf-compress.sh.php'
license=('APACHE')
depends=('ghostscript' 'imagemagick')
source=("${pkgname}-${pkgver}::https://www.timedicer.co.uk/programs/${pkgname}.sh")
sha256sums=('SKIP')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim: ts=2 sw=2 et:
