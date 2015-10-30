# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=('python-heatclient'
         'python2-heatclient')
pkgver='0.8.0'
pkgrel='1'
pkgdesc='Python client library for Heat'
arch=('any')
url='https://launchpad.net/python-heatclient'
license=('Apache')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5cd1c855ee21f18bfffbc7269e40c417b953d0855aa3cc8b56d778b8612467d5')

package_python-heatclient()
{
    depends=('python-babel'
             'python-pbr'
             'python-iso8601'
             'python-prettytable'
             'python-oslo-i18n'
             'python-oslo-serialization'
             'python-oslo-utils'
             'python-keystoneclient'
             'python-swiftclient'
             'python-yaml'
             'python-requests'
             'python-six')
    makedepends=('python-setuptools')
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py \
        install \
            --root="${pkgdir}" \
            --optimize=1
}

package_python2-heatclient()
{
    depends=('python2-babel'
             'python2-pbr'
             'python2-iso8601'
             'python2-prettytable'
             'python2-oslo-i18n'
             'python2-oslo-serialization'
             'python2-oslo-utils'
             'python2-keystoneclient'
             'python2-swiftclient'
             'python2-yaml'
             'python2-requests'
             'python2-six')
    makedepends=('python2-setuptools')
    cd "${srcdir}/python-heatclient-${pkgver}"
    python2 setup.py \
        install \
            --root="${pkgdir}" \
            --optimize=1
}
