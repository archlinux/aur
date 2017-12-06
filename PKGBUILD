# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-xnatpy
pkgver=0.3.4
pkgrel=3
pkgdesc="A new XNAT client that exposes XNAT objects/functions as python objects/functions."
arch=('any')
_name=xnat
url="https://bitbucket.org/bigr_erasmusmc/xnatpy"
license=('Apache')
groups=()
depends=('python' 'python-isodate' 'python-progressbar' 'python-six' 'python-requests')
makedepends=()
provides=()
conflicts=()
replaces=('xnatpy')
backup=()
options=(!emptydirs)
install=
source=("https://bitbucket.org/bigr_erasmusmc/xnatpy/get/${pkgver}.tar.bz2")
sha256sums=('2eeb35c07090958fb667d572b4c355398d3eb562f0e5f02a88a48d9e96cd9ea3')

package() {
  cd "$srcdir"/bigr_erasmusmc-xnatpy-*
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
