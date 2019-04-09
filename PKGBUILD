# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=python-xnatpy
pkgver=0.3.16
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
# We temporarily have to use the hg version due to Python 3.7 incompatibility in 0.3.10 proper
#source=("https://bitbucket.org/bigr_erasmusmc/xnatpy/get/0f6e6a0d245f.tar.gz")
sha256sums=('257fe7c68fbd5fbab51495c93e865f951e7e7bed948793881428322ee8b4adcc')

package() {
  cd "$srcdir"/bigr_erasmusmc-xnatpy-*
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
