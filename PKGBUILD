# Maintainer : fft
# Contributor : pianoslum <pianoslum@mailbox.org>
# Contributor : Florent H. CARRÉ<colundrum@users.noreply.github.com>

pkgname=gprof2dot
pkgver=2025.04.14
pkgrel=1
pkgdesc='A Python script to convert the output from many profilers into a dot graph.'
arch=('any')
url='https://github.com/jrfonseca/gprof2dot/'
license=('LGPL-3.0-only')
depends=('python' 'graphviz')
makedepends=('python-setuptools')
provides=(gprof2dot)
source=("https://github.com/jrfonseca/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('47521b4fb13edeceb6af45503d1af84165fe84866a06c50e738e8a0b7a7bd924')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
}
