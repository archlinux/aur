pkgbase=('python-fastentrypoints')
pkgname=('python-fastentrypoints')
_module='fastentrypoints'
pkgver='0.4'
pkgrel=1
pkgdesc="Makes entry_points specified in setup.py load more quickly"
url="https://github.com/ninjaaron/fast-entry_points"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/d1/88/e43cabf42ba4916e9cf13eaed5011350a028810cf8ce19bb7e87fa611694/fastentrypoints-0.4.tar.gz")
md5sums=('08d34e22d5134b9af2e7a74f105e7957')

build() {
    cd "${srcdir}/fastentrypoints-0.4"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/fastentrypoints-0.4"
    pip3 install --ignore-installed --root="${pkgdir}" "fastentrypoints"*.whl
}
