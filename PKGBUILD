# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=gitflow-avh
pkgver=1.12.0
pkgrel=1
pkgdesc="Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality."
arch=('any')
url='https://github.com/petervanderdoes/gitflow/'
license=('LGPL')
depends=('git')
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git')
source=("https://github.com/petervanderdoes/gitflow/archive/${pkgver}.tar.gz")
sha512sums=('9079a6491bf69d5b5ebda2fd9362c5a775412db443c17b51d3f5fc09520a2abf81d80d8692b0d5a5696934709330588777c9d46432656287808690e169e98a17')

package(){
   cd "$srcdir/$pkgname-$pkgver"
   make prefix="$pkgdir/usr" install
}
