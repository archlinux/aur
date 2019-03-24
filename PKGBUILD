#Maintainer: kia hamedi <kia.arta9793@gmail.com>
pkgname=filefolders
pkgver=1.0.0
pkgrel=1
pkgdesc="bash Script to categorize your files in folders"
arch=('any')
url="http://kiahamedi.ir"
license=('GPL')
depends=('bash')
checkdepends=()
optdepends=()
install=
changelog=
source=(${pkgname}-${pkgver}.zip::https://github.com/kiahamedi/K_folders/archive/master.zip)

package() {
  unzip -p ${pkgname}-${pkgver}.zip K_folders-master/filefolders > filefolders
  install -D -t "$pkgdir/usr/bin" "$srcdir/filefolders"
}

md5sums=('39f696e0d2d0d3b4208c9d1ff89bb17a')
