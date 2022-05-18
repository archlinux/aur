# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=python-musicpd
pkgver=0.8.0
pkgrel=1
pkgdesc="An MPD (Music Player Daemon) client library written in pure Python."
arch=('any')
url="https://pypi.python.org/pypi/python-musicpd"
license=('GPL')
depends=('python')
makedepends=('make')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/6e/63/167108391d14517be2735c72cb85fa429528801e73a44e7d3ce8f435b4bd/python-musicpd-0.8.0.tar.gz")
md5sums=('5346174c287fac8c089630ab0cf9de29')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
        python setup.py install --prefix=/usr --root="$pkgdir" || return 1
        }

