# Maintainer: James Zhu <james.zhu.engineer@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-pyrtlsdr
pkgver=0.2.92
pkgrel=1
pkgdesc="Python wrapper for librtlsdr (a driver for Realtek RTL2832U based SDR's)"
arch=(any)
url="http://pypi.org/project/pyrtlsdr"
license=('GPL3')
makedepends=('python-setuptools'
	     'python-pypandoc'
	     'git')
depends=('python-sphinx'
	 'python-sphinx_rtd_theme'
	 'm2r')
options=(!emptydirs)
source=("git+https://github.com/roger-/pyrtlsdr#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/pyrtlsdr"
  python setup.py install --root="$pkgdir/" --optimize=1
}
