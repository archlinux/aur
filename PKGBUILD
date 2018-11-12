# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=claws-mail-theme-basicsvg
pkgver=0.6.3
pkgrel=1
pkgdesc='Claws-mail icon theme BasicSVG'
url='http://rame.altervista.org/cmbasicsvg/'
arch=('any')
depends=('claws-mail')
license=('GPL')
source=("http://rame.altervista.org/dl.php?fp=cmbasicsvg/BasicSVG-${pkgver}.tar.gz")
sha256sums=('e50cbbd70dab85f60fb36346a60ecf84f153a1bdcc9d2daa8dcdf6889e6c92e6')

package() {
  mkdir -p "${pkgdir}/usr/share/claws-mail/themes/"
  cp -a 'BasicSVG' "${pkgdir}/usr/share/claws-mail/themes/"
}
