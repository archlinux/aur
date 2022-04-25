# Maintainer: brodokk <brodokk at brodokk dot space>

_pkgname=flake8-rst-docstrings
pkgname=python-$_pkgname

pkgver=0.2.5
pkgrel=1
pkgdesc="flake8 plugin to validate Python docstrings as reStructuredText (RST)"

url='https://github.com/peterjc/flake8-rst-docstrings'
arch=('any')
license=('MIT')

depends=('python' 'python-restructuredtext_lint')

source=("https://github.com/peterjc/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('7be16023db379e24fd6f13a3ae59add3e0f52f3df0c16c7ccd9cec44ac1b861fc85db7597409619ef628d27ddaf3702640edda9e9d9a8f6aade4c43c78b2ef69')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

