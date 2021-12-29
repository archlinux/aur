# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.29.1
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git' 'fnm')
source=("$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
md5sums=('f75db817515515ddbe0bf506ee6856d2')

package() {
  install -Dm755 fnm "$pkgdir/usr/bin/fnm"
}
