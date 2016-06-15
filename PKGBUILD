#Maintainer:xgdgsc<xgdgsc@gmail.com>

pkgname=rodeo
pkgver=2.0.0
pkgrel=1
pkgdesc="A data science IDE for Python"
url='https://www.yhat.com/products/rodeo'
arch=('i686' 'x86_64')
depends=('jupyter' 'gconf')
license=('AGPL3')
install=rodeo.install
md5sums_i686=('fe1dafa365c75053d8066cb3aebc25a3')
md5sums_x86_64=('2b21221b71eb1e8723cd67680fa5c820')

source_x86_64=("https://github.com/yhat/rodeo/releases/download/v$pkgver/rodeo-$pkgver-amd64.deb")
source_i686=("https://github.com/yhat/rodeo/releases/download/v$pkgver/rodeo-$pkgver-ia32.deb")

build() {
  cd "${srcdir}"
  tar -xf data.tar.xz
}

package() {
    mv "$srcdir/usr" "$pkgdir"
    mv "$srcdir/opt" "$pkgdir"
}
