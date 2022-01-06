# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=darglint
pkgname=python-$_pkgname

pkgver=1.8.1
pkgrel=1
pkgdesc="A python documentation linter which checks that the docstring description matches the definition."

url='https://github.com/terrencepreilly/darglint'
arch=('any')
license=('MIT')

depends=('python' 'python-setuptools')

source=("https://github.com/terrencepreilly/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('320f52fa366472358f1d10c06d92f8a26eada014efa94d43c37645d6003c4c65e38ad91c60b031555649a36351f73bac9feaa005274f498dab9b16a4235e34d4')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

