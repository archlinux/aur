# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-annotations-complexity
pkgname=python-$_pkgname

pkgver=0.0.6
pkgrel=1
pkgdesc="flake8 plugin to validate annotations complexity"

url='https://github.com/best-doctor/flake8-annotations-complexity'
arch=('any')
license=('MIT')

depends=('python')

source=("https://github.com/best-doctor/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('41a441d669f7db9fd329f5d537b079e882a61df0f6761861f99bebd6d68a0e93a1247201d29df34dee5563cd6aba735d87387424d81675c28dadd7b9813b0926')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

