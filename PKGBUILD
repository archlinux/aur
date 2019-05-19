# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=gitflow-avh
pkgver=1.12.2
pkgrel=1
pkgdesc="Extend git with Vincent Driessen's branching model. The AVH Edition adds more functionality."
arch=('any')
url='https://github.com/petervanderdoes/gitflow/'
license=('LGPL')
depends=('git')
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git')
source=("https://github.com/petervanderdoes/gitflow/archive/${pkgver}.tar.gz")
sha512sums=('75209f84e2fe230d29eb5f73b8f9e9e69b97940c9ed01a0f43f81b583c70111fe193f2599bb5de9ef355833a9d5d7686c2a666bc92d3e0f1198d7dcf3432a882')

package(){
   cd "$srcdir/$pkgname-$pkgver"
   make prefix="$pkgdir/usr" install
}
