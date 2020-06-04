# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-pep3101
pkgname=python-$_pkgname

pkgver=1.3.0
pkgrel=1
pkgdesc="Checks for old string formatting."

url='https://github.com/gforcada/flake8-pep3101'
arch=('any')
license=('GPLv2')

depends=('python')

source=("https://github.com/gforcada/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('48bbe5f202f86ba054648344d7d7b0de5341e773d2f3cfc5a715ea80f7402240692903c0d383a80c5c135d175ecd856db3f0cd076b8c0dc8da9bee11b3f59a33')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

