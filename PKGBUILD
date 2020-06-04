# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-coding
pkgname=python-$_pkgname

pkgver=1.3.2
pkgrel=1
pkgdesc="Adds coding magic comment checks (coding:) to flake8."

url='https://github.com/tk0miya/flake8-coding'
arch=('any')
license=('Apache-2.0')

depends=('python')

source=("https://github.com/tk0miya/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('1a2301d0eb945c4c3637a49272e2f4f496fb42b52125bcc37131763c7528c13c99070b876233f4b083dba248c94ebd742d40399593abae30c8a8d332d5a5e97f')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

