# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=python-musicpd
pkgver=0.7.0
pkgrel=1
pkgdesc="An MPD (Music Player Daemon) client library written in pure Python."
arch=('any')
url="https://pypi.python.org/pypi/python-musicpd"
license=('GPL')
depends=('python')
makedepends=('make')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/ff/bd/fde097f8feeb70562cbcbe29d5dfec06db22e2598a003dc732af96a88711/${pkgname}-${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('e1f6dbd6f104b4974de941b9acbf0261')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
        python setup.py install --prefix=/usr --root="$pkgdir" || return 1
        }

md5sums=('baa4b0c290544572267d9ae08be0bf12')
