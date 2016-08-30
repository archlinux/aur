# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=gitflow-avh
pkgver=1.10.1
pkgrel=1
pkgdesc="Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality."
arch=('any')
url='https://github.com/petervanderdoes/gitflow/'
license=('BSD', 'LGPL')
depends=('git')
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git')
source=("https://github.com/petervanderdoes/gitflow/archive/${pkgver}.tar.gz")
md5sums=('35effa3455ce815e14a2df4e5cea1f8d')

package(){
   cd "$srcdir/$pkgname-$pkgver"
   make prefix="$pkgdir/usr" install
}
