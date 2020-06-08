# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.21.0
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built in ReasonML "
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git')
source=("$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
md5sums=('dea4caefc727ee2d0ea479bdb730993d')

package() {
  install -Dm755 fnm-linux/fnm "$pkgdir/usr/bin/fnm"
}
