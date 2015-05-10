# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: K1412 <swaelens.jonathan@openmailbox.org>
pkgname=smarty3-i18n
pkgver=1.0
pkgrel=3
pkgdesc="smarty3-i18n provides gettext support for Smarty,
the popular PHP templating engine (http://smarty.php.net/)." 
arch=('any')
url='https://forge.fusiondirectory.org/projects/smarty3-i18n'
depends=('smarty3') 
licence='LGPL'

source=("http://repos.fusiondirectory.org/sources/1.0/smarty3-i18n/${pkgname}-${pkgver}.tar.gz")
md5sums=('63ab56cdf5cf01aba170ba5fbd932fcd')

package() {
  cd ${pkgname}-${pkgver}/
  
  mkdir -p ${pkgdir}/usr/share/php/smarty3/plugins/
  cp ./block.t.php ${pkgdir}/usr/share/php/smarty3/plugins/

  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./AUTHORS ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./COPYING ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./ChangeLog ${pkgdir}/usr/share/doc/${pkgname}/
  cp ./README ${pkgdir}/usr/share/doc/${pkgname}/
}

