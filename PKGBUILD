#Maintainer: kia hamedi <kia.arta9793@gmail.com>
pkgname=sdm-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple Download Manager - Bash Script"
arch=('any')
url="https://github.com/kiahamedi/SDM"
license=('GPL')
depends=('aria2' 'libnotify')
checkdepends=()
optdepends=()
install=
changelog=
source=(${pkgname}-${pkgver}.zip::https://github.com/kiahamedi/SDM/archive/master.zip)

package() {
  unzip -p ${pkgname}-${pkgver}.zip SDM-master/sdm > sdm-git
  install -D -t "$pkgdir/usr/bin" "$srcdir/sdm-git"
}
md5sums=('cde3949f3d8e5c141ebddbf4406d399e')
