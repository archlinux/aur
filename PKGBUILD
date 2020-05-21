# Maintainer: neodarz <neodarz at neodarz dot net>

pkgname=python-pylibscrypt
_pkgname=pylibscrypt

pkgver=1.8.0
pkgrel=1
pkgdesc="scrypt for python"

url='https://github.com/jvarho/pylibscrypt'
arch=('any')
license=('ISC')

depends=('python')

source=("https://github.com/jvarho/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('a229e92bd3e84407bfbaf6f815ce43dde0d24a3c4b57b34193c48671d8326749aa68ee82c359c78d29d49be65021763229df53583c6fccf0bae6cc6d0814cb4e')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
