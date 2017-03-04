pkgbase=('python-fastentrypoints')
pkgname=('python-fastentrypoints')
_module='fastentrypoints'
pkgver='0.9'
pkgrel=1
pkgdesc="Makes entry_points specified in setup.py load more quickly"
url="https://github.com/ninjaaron/fast-entry_points"
depends=('python')
makedepends=('python-pip' 'python-wheel')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/87/13/685905bf2639360b1307d1be4bfa77cda14b3c4b73261d22a6d1e1447e87/fastentrypoints-0.9.tar.gz")
md5sums=('9098bd2431f702cbf2747616883f84e6')

build() {
    cd "${srcdir}/fastentrypoints-0.9"
    pip3 wheel .
}

package() {
    depends+=()
    cd "${srcdir}/fastentrypoints-0.9"
    pip3 install --ignore-installed --root="${pkgdir}" "fastentrypoints"*.whl
}
