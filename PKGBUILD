# Maintainer: Egor Panfilov <multicolor{dot}mood{at}gmail{dot}com>

pkgbase=python-hmmlearn-git
pkgname=('python-hmmlearn-git' 'python2-hmmlearn-git')
pkgver=20150828
pkgrel=1
pkgdesc="Algorithms for unsupervised learning and inference of Hidden Markov Models for Python."
arch=('i686' 'x86_64')
url="http://hmmlearn.github.io/hmmlearn/"
license=('custom: Copyright (c) 2015, hmmlearn authors and contributors')
makedepends=('git')
options=(!emptydirs)
source=(git://github.com/hmmlearn/hmmlearn.git)
md5sums=("SKIP")

package_python-hmmlearn-git() {
  depends=('python' 'python-numpy>=1.6' 'python-scipy>=0.11' 'python-scikit-learn>=0.15')
  cd "$srcdir/hmmlearn"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-hmmlearn-git() {
  depends=('python2' 'python2-numpy>=1.6' 'python2-scipy>=0.11' 'python2-scikit-learn>=0.15')
  cd "$srcdir/hmmlearn"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

