# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pypillowfight"
_pkgname="pypillowfight"
pkgver="0.2.2"
pkgrel="1"
pkgdesc="Library containing various image processing algorithms"
url="https://github.com/jflesch/libpillowfight"
depends=('python' )
makedepends=('python' 'python-setuptools')
license=('GPL3')
arch=('any')
changelog="ChangeLog"
source=("https://github.com/jflesch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6fafd282c5ff1b6edde728d80bc7c0d6')

build() {
    cd ${srcdir}/libpillowfight-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/libpillowfight-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}
