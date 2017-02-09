# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgbase=python-tflearn
pkgname=('python-tflearn')
pkgdesc="TFlearn is a modular and transparent deep learning library built on top of Tensorflow."
pkgver=0.2.2
pkgrel=2
arch=('any')
url="http://tflearn.org/"
license=('MIT')
source=("https://github.com/tflearn/tflearn/archive/${pkgver}.tar.gz")
depends=('python-numpy' 'python-six' 'python-pillow' 'python-tensorflow')
makedepends=('python-setuptools')
md5sums=('4584e81f6af61389646c943b0e308c38')

package() {
  cd "$srcdir/tflearn-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
