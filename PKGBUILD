# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-rst-docstrings
pkgname=python-$_pkgname

pkgver=0.0.14
pkgrel=1
pkgdesc="flake8 plugin to validate Python docstrings as reStructuredText (RST)"

url='https://github.com/peterjc/flake8-rst-docstrings'
arch=('any')
license=('MIT')

depends=('python' 'python-restructuredtext_lint')

source=("https://github.com/peterjc/$_pkgname/archive/v$pkgver.tar.gz")
sha512sums=('bdafb2817a53db5d7c74ff46c4839a835751b202b3c33960bf7dfea7e255f9d7580ae918a8a8654f33df26cdd16db1733d5730761150142061cf638de57d8e4e')

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

