# Maintainer : fft
# Contributor : pianoslum <pianoslum@mailbox.org>
# Contributor : Florent H. CARRÉ<colundrum@users.noreply.github.com>

pkgname=gprof2dot
pkgver=2022.07.29
pkgrel=1
pkgdesc='A Python script to convert the output from many profilers into a dot graph.'
arch=('any')
url='https://github.com/jrfonseca/gprof2dot/'
license=('LGPL')
depends=('python' 'graphviz')
makedepends=('python-setuptools')
provides=(gprof2dot)
source=("https://github.com/jrfonseca/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f1c1e0347fe773d8a73117645f58cbefef03fb56e4abb10cb897d57a51cbe01a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
}
