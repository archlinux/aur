# Maintainer: Your Name <youremail@domain.com>
pkgname=python-rtttl
pkgver=0.2
pkgrel=1
pkgdesc="Nokia Ring Tone Text Transfer Language (RTTTL) parser for python"
arch=(any)
url="https://github.com/asdwsda/rtttl"
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("python-rtttl-0.2.tar.gz::https://github.com/asdwsda/rtttl/archive/0.2.tar.gz")
md5sums=("44272e32e72db980caf472de8c263239")

package() {
  cd "$srcdir/rtttl-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
