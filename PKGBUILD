# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=python-musicpd
pkgver=0.4.2
pkgrel=1
pkgdesc="An MPD (Music Player Daemon) client library written in pure Python."
arch=('any')
url="https://pypi.python.org/pypi/python-musicpd"
license=('GPL')
depends=('python')
makedepends=('make')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

md5sums=('acdaa0d479959a6af6224ce215d17577')
