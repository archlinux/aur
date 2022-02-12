# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pdf-compress
pkgver=0.7
pkgrel=1
pkgdesc='Compress an overlarge pdf file'
arch=('any')
url='https://www.timedicer.co.uk/programs/help/pdf-compress.sh.php'
license=('APACHE')
depends=('ghostscript' 'imagemagick')
source=("${pkgname}-${pkgver}::https://www.timedicer.co.uk/programs/${pkgname}.sh")
sha256sums=('d3fdf86697972988af3a4a25c3f587f798f799e133c294c129028ea081996559')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
