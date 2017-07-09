# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>
pkgname=rlipython
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Readline Interface for IPython 3.4+"
arch=('any')
url="https://github.com/ipython/rlipython"
license=('BSD')
depends=('ipython>=6.0')
makedepends=('python-setuptools')
source=("git+https://github.com/ipython/rlipython.git#commit=e218435e396a5798e001f732afa5b5e5fdc93ce0")
md5sums=('SKIP')

package() {
	cd "$pkgname"
  python setupegg.py install -O1 --root="$pkgdir"

  install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
