# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>
pkgname=python-sphinx-rtd-theme
pkgver=0.1.10a0
pkgrel=1
pkgdesc="Sphinx theme for readthedocs.org"
arch=('any')
url="https://github.com/snide/sphinx_rtd_theme"
license=('MIT')
depends=()
source=(https://pypi.io/packages/source/s/sphinx_rtd_theme/sphinx_rtd_theme-$pkgver.tar.gz)
sha256sums=('1225df3fc8337b14d53779435381b7f7705b9f4819610f6b74e555684cee2ac4')

package() {
    cd "$srcdir/sphinx_rtd_theme-$pkgver"

    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
