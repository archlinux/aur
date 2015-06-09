# Maintainer: Bennett Goble <nivardus@gmail.com>

pkgname=glh-linear
pkgver=1
pkgrel=3
pkgdesc="A platform-indepenedent C++ OpenGL helper library."
url="http://www.nvidia.com/"
arch=('i686' 'x86_64')
license=('custom')
source=(https://github.com/nivardus/glh-linear/archive/${pkgver}.tar.gz)
sha256sums=('2cb8286579516c251c6d6d316c6263ca15a7ace3aa85547181ad6d6cc47fb6f6')

package() {
	mkdir -p ${pkgdir}/usr/include
	tar -C ${pkgdir}/usr/include -zxvf ${startdir}/${pkgver}.tar.gz
	mv glh-linear-${pkgver}/{GL,glh} ${pkgdir}/usr/include/ && rm -r ${pkgdir}/usr/include/glh-linear-${pkgver}
}
