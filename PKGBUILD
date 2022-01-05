# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-executable
pkgname=python-$_pkgname

pkgver=2.1.1
pkgrel=1
pkgdesc="A Flake8 plugin for checking executable permissions and shebangs."

url='https://github.com/xuhdev/flake8-executable'
arch=('any')
license=('GPLv3')

depends=('python')

source=("https://github.com/xuhdev/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('ad3ae85fbfeb1b24e1709a8108a855934c4135986bcca4c444947660697f948b7767fabc074473b2dd74374c58cbc1f633b443f20e4676f6a9c6857b7328a0c1')

package() {
    cd "$_pkgname-$pkgver"
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root="$pkgdir" --optimize=1
}

