# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=pdf-compress
pkgver=1.3
pkgrel=2
pkgdesc='Compress an overlarge pdf file'
arch=('any')
url='https://www.timedicer.co.uk/programs/help/pdf-compress.sh.php'
license=('APACHE')
depends=('ghostscript' 'imagemagick')
source=("${pkgname}-${pkgver}::https://www.timedicer.co.uk/programs/${pkgname}.sh")
sha256sums=('5d097872d01fcca73e9ddb062b641c46bb99c82c99c6411502b9a76ce8ff4c6a')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
