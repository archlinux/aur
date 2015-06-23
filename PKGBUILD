# Maintainer: gandalf3 <zzyxpaw at gmail dot com>
# Contributor: Leonardo "sud_crow" Gallego <leonardo@archlinux-es.org>

pkgname=gimp-plugin-reflection
pkgver=285.923
pkgrel=2
pkgdesc="Gimp plugin script that adds reflection to pictures and images with a single click"
arch=('i686' 'x86_64')
url="https://github.com/otaviocc/gimpscripts"
license=('GPL')
depends=('gimp')
makedepends=('git')
source=(git+https://github.com/otaviocc/gimpscripts.git) # raw source can be found here: https://raw.github.com/otaviocc/gimpscripts/master/gimp-reflection.scm
md5sums=('SKIP') # source is not static

package() {
	  cd ${srcdir}
	  mkdir -p "${pkgdir}/usr/share/gimp/2.0/scripts/"
	  cd gimpscripts
	  cp gimp-reflection.scm "${pkgdir}/usr/share/gimp/2.0/scripts/gimp-reflection.scm"
	} 

