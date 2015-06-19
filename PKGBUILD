# Contributor: Renato Coutinho <renato dot coutinho at gmail dot com>
pkgname=python2-nodepy-git
pkgver=0.5
pkgrel=1
pkgdesc="Python package for designing, analyzing, and testing numerical methods for initial value ODEs"
arch=('i686' 'x86_64')
url="http://numerics.kaust.edu.sa/nodepy/"
license=('BSD')
source=("git://github.com/ketch/nodepy.git")
md5sums=('SKIP')

depends=('python2' 'python2-numpy' 'python2-sympy')
makedepends=('git' 'python2-distribute')

#build() {
#}

package() {
   cd ${srcdir}/nodepy
   python2 setup.py install --prefix=/usr --root=${pkgdir}
   install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
