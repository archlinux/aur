# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer: kia hamedi <kia.arta9793@gmail.com>
pkgname=gitpusher
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple bash script to make it easier to work with the Github and Gitlab"
arch=('any')
url="http://kiahamedi.ir"
license=('GPL')
depends=('git')
checkdepends=()
optdepends=()
install=
changelog=
source=(${pkgname}-${pkgver}.zip::https://github.com/kiahamedi/gitpusher/archive/master.zip)

package() {
  unzip -p ${pkgname}-${pkgver}.zip gitpusher-master/gitpusher > gitpusher
  install -D -t "$pkgdir/usr/bin" "$srcdir/gitpusher"
}

md5sums=('b95ce9ced33c3ea04a4c8a06297ea4dd')
