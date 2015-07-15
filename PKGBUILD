# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=python2-pygsr
pkgver=0.1
pkgrel=1
pkgdesc="Simple way to access google api for speech recognition with python"
arch=('any')
url="https://bitbucket.org/drneox/pygsr/"
license=('GPL')
groups=()
depends=('python2' 'python2-pyaudio' 'sox')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/source/p/pygsr/pygsr-0.1.tar.gz#md5=993b3cdb6651d05a250963bf423909d1')
md5sums=('993b3cdb6651d05a250963bf423909d1')

package() {
  cd "$srcdir/pygsr-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
