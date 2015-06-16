# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-pinject"
pkgname="${_pkgname}"
pkgver=0.10.2
pkgrel=1
pkgdesc="A pythonic dependency injection library"
arch=('any')
url="https://github.com/google/pinject"
license=('APACHE')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/google/pinject/archive/v$pkgver.tar.gz 'object_providers.patch')
md5sums=('ec41fb4da9ddcbf798722d7e660e8d6a' 'b395777fa022cf684cb0e7e49e88e6a0')

package(){
    cd "${srcdir}/pinject-${pkgver}"
       python setup.py install --root="$pkgdir" --prefix=/usr
}

