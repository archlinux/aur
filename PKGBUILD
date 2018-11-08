# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=claws-mail-theme-basicsvg
pkgver=0.5
pkgrel=2
pkgdesc='Claws-mail icon theme BasicSVG'
url='http://rame.altervista.org/cmbasicsvg/'
arch=('any')
depends=('claws-mail')
license=('GPL')
source=("http://rame.altervista.org/dl.php?fp=cmbasicsvg/BasicSVG-${pkgver}.tar.gz")
sha256sums=('13cf5a63fc20ceea415888dabdb3af436716f0067d04904fe0cac49684b45fd9')

package() {
  mkdir -p "${pkgdir}/usr/share/claws-mail/themes/"
  cp -a 'BasicSVG' "${pkgdir}/usr/share/claws-mail/themes/"
}
