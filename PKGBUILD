# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

_pkgname=gitflow
pkgname=gitflow-avh
pkgver=1.8.0
pkgrel=1
pkgdesc="Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality."
arch=('any')
url='https://github.com/petervanderdoes/gitflow/'
license=('BSD', 'LGPL')
depends=('git')
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git')
source=("https://github.com/petervanderdoes/gitflow/archive/${pkgver}.tar.gz")
md5sums=('78a0cac73a35a09b68e09817fe4a3448')

package(){
   cd "$srcdir/$_pkgname-$pkgver"
   make prefix="$pkgdir/usr" install
}
