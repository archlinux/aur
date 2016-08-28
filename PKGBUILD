# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: perlawk

pkgname=dlib
_pkgname=dlib
pkgver=19.1
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('i686' 'x86_64')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('glibc')
optdepends=('cblas: for BLAS support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'sqlite: for sqlite support')
source=(http://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('8201f9b74602aebd5a68c261ff97e00c')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -Dm755 -d "${pkgdir}/usr/include"
	cp -a ${_pkgname} "${pkgdir}/usr/include"
}
