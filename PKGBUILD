#Maintainer:xgdgsc<xgdgsc@gmail.com>

pkgname=rodeo
pkgver=2.0.7
pkgrel=1
pkgdesc="A data science IDE for Python"
url='https://www.yhat.com/products/rodeo'
arch=('x86_64')
depends=('jupyter' 'gconf')
license=('AGPL3')
install=rodeo.install
md5sums_x86_64=('01ea23ea00c5bdfb99f342429a1652d3')

source_x86_64=("https://github.com/yhat/rodeo/releases/download/v$pkgver/rodeo-$pkgver-amd64.deb")
# source_i686=("https://github.com/yhat/rodeo/releases/download/v$pkgver/rodeo-$pkgver-ia32.deb")

build() {
  cd "${srcdir}"
  tar -xf data.tar.xz
}

package() {
    mv "$srcdir/usr" "$pkgdir"
    mv "$srcdir/opt" "$pkgdir"
}
