# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

pkgname=scm-source
pkgver=1.0.8
pkgrel=1
pkgdesc="A simple command line tool to generate scm-source.json"
url="https://github.com/zalando-stups/python-scm-source"
license=('APACHE')
arch=('any')
makedepends=('python-setuptools')
depends=('python' 'python-clickclick' 'python-yaml')
source=("http://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c0a4b0a588c3f334eac864dea0688b3d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}

# vim:set sw=2 sts=2 ft=sh et:
