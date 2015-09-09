# Maintainer: Florijan Hamzic <fh@infinicode.de>

pkgname=python-glue
pkgver=0.11
pkgrel=1
pkgdesc="Glue is a simple command line tool to generate CSS sprites"
arch=('i386' 'x86_64')
url="https://github.com/jorgebastida/glue"
license=('MIT')
depends=('python>=3.1 python-jinja python-pillow')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/jorgebastida/glue/archive/${pkgver}.tar.gz)
md5sums=('1e0420af0da9004de621a054094f9de0')

package(){
    cd "${srcdir}/glue-${pkgver}"
    python setup.py install --root="$pkgdir" --prefix=/usr
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

