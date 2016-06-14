# Maintainer: Dany Marcoux <danymarcoux at gmail dot com>

pkgname=tag-ag
pkgver=1.0.0
pkgrel=3
pkgdesc='tag: Instantly jump to your ag matches'
arch=('i686' 'x86_64')
url='https://github.com/aykamko/tag'
license=('MIT') # https://github.com/aykamko/tag/blob/master/LICENSE
makedepends=('go')
provides=('tag')
source=("https://github.com/aykamko/tag/archive/$pkgver.tar.gz")
sha256sums=('ef14e3573f7f108f3f4086b38d0e1c0d9ab9130f88c476de1428bcd6f2c069a8')

package() {
  cd "tag-$pkgver"
  make
}
