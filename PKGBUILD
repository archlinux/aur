# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-rst-docstrings
pkgname=python-$_pkgname

pkgver=0.0.13
pkgrel=1
pkgdesc="flake8 plugin to validate Python docstrings as reStructuredText (RST)"

url='https://github.com/peterjc/flake8-rst-docstrings'
arch=('any')
license=('MIT')

depends=('python' 'python-restructuredtext_lint')

source=("https://github.com/peterjc/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('aefa10f47f4815d7cb4106f1dc1914cc557796c738586c872103665d861f99d6bd8e076ef7fda64a6822a84230d88060f803b2bddd0b5c103e0562ee1211e83e')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

