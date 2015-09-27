# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=python-broadcast-logging
pkgver=0.1
pkgrel=1
pkgdesc="A Python logging system handler which broadcasts log messages and a matching receiver executable."
arch=(any)
url="https://github.com/languitar/broadcast-logging"
license=('LGPL3')
depends=('python3')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/broadcast-logging/archive/release-${pkgver}.tar.gz")
md5sums=('4b12316908c716c08bd3f6297ad18ed9')

package() {
    cd "broadcast-logging-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
