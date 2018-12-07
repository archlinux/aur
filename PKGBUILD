# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=claws-mail-theme-basicsvg
pkgver=0.6.4
pkgrel=1
pkgdesc='Claws-mail icon theme BasicSVG'
url='http://rame.altervista.org/cmbasicsvg/'
arch=('any')
depends=('claws-mail')
license=('GPL')
source=("http://rame.altervista.org/dl.php?fp=cmbasicsvg/BasicSVG-${pkgver}.tar.gz")
sha256sums=('6136910b431bc39496557d9cf5786607c4c95473e8d9eac2d3f8d91f0a0dee3b')

package() {
  mkdir -p "${pkgdir}/usr/share/claws-mail/themes/"
  cp -a 'BasicSVG' "${pkgdir}/usr/share/claws-mail/themes/"
}
