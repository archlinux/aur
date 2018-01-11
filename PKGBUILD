# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-xnatpy
pkgver=0.3.5
pkgrel=1
pkgdesc="A new XNAT client that exposes XNAT objects/functions as python objects/functions."
arch=('any')
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
sha256sums=('3c8b24247ca0e189fc40d7ee194fcda706084b4efe6036f4765d4fc4c4790a75')

package() {
  cd "$srcdir"/bigr_erasmusmc-xnatpy-*
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
