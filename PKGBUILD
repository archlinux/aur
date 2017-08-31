# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: perlawk

pkgname=dlib
_pkgname=dlib
pkgver=19.6
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('i686' 'x86_64')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('glibc')
optdepends=('cblas: for BLAS support'
            'cuda: for CUDA support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'sqlite: for sqlite support')
source=(https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('40292a4343499b18b881f69b26a56c1ecfe95cb9b9f964f37c1064c6fc415e2c')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -Dm755 -d "${pkgdir}/usr/include"
	cp -a ${_pkgname} "${pkgdir}/usr/include"
}
