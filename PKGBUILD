# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: perlawk

pkgname=dlib
_pkgname=dlib
pkgver=19.7
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('i686' 'x86_64')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('glibc')
optdepends=('blas: for BLAS support'
            'cuda: for CUDA support'
            'cudnn: for CUDNN support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'neon: for neon support'
            'sqlite: for sqlite support')
source=(https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('825dbe45e0d379a4e5584c2918b1e0cb37e9ed75657766fd7b2b4f3e05f892d6')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -Dm755 -d "${pkgdir}/usr/include"
	cp -a ${_pkgname} "${pkgdir}/usr/include"
}
