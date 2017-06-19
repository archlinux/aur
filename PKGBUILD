# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=gitflow-avh
pkgver=1.11.0
pkgrel=1
pkgdesc="Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality."
arch=('any')
url='https://github.com/petervanderdoes/gitflow/'
license=('LGPL')
depends=('git')
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git')
source=("https://github.com/petervanderdoes/gitflow/archive/${pkgver}.tar.gz")
sha512sums=('3659f876febbec10457ba7ba1ecbaeb7f29b11cc8caf94042f54b8f8e2265d2bb31cbcdf7dfafae9c5d04e0ca57adddfa67f9e67df4a5dcf0bc412f1216a3c07')

package(){
   cd "$srcdir/$pkgname-$pkgver"
   make prefix="$pkgdir/usr" install
}
