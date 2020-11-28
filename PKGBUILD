# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-mbedtls
pkgver=1.4.0
pkgrel=2
pkgdesc="A free cryptographic library for Python that uses mbed TLS for back end."
arch=(any)
url="https://github.com/Synss/python-mbedtls/releases"
license=('Apache')
makedepends=('python-setuptools')
source=(https://github.com/Synss/python-mbedtls/archive/1.4.0.tar.gz)
sha256sums=('SKIP')


package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
