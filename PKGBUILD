# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgbase=python-tflearn
pkgname=('python-tflearn')
pkgdesc="TFlearn is a modular and transparent deep learning library built on top of Tensorflow."
pkgver=0.3.1
pkgrel=1
arch=('any')
url="http://tflearn.org/"
license=('MIT')
source=("https://github.com/tflearn/tflearn/archive/${pkgver}.tar.gz")
depends=('python-numpy' 'python-six' 'python-pillow' 'python-tensorflow')
makedepends=('python-setuptools')
md5sums=('aa1f8d58f1e66894af12aa132797a445')

package() {
  cd "$srcdir/tflearn-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
