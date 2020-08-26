# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-executable
pkgname=python-$_pkgname

pkgver=2.0.4
pkgrel=1
pkgdesc="A Flake8 plugin for checking executable permissions and shebangs."

url='https://github.com/xuhdev/flake8-executable'
arch=('any')
license=('GPLv3')

depends=('python')

source=("https://github.com/xuhdev/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('0ab872cac5f6c6cf197486d45f6d996996d5387949bafdc765c16971a4ad19ff0eaa7b8702ab8d63a0289846066cc3d4747ac212a288abee7ec2bb6831fd1a09')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

