# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-bandit
pkgname=python-$_pkgname

pkgver=2.1.0
pkgrel=1
pkgdesc="Automated security testing using bandit and flake8."

url='https://github.com/tylerwince/flake8-bandit'
arch=('any')
license=('MIT')

depends=('python' 'bandit')

source=("https://github.com/tylerwince/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('28e637d9dd59a18954b61b68c001a11784c5b0c750ef0701f04041f2cfd66ba4c33469f1bb8a338ac4016f70bdf44f4532c2bf67c9d8b822e7c8d1881b0b427c')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

