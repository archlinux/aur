# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.27.0
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git')
source=("$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
md5sums=('a139207a6898f5a62fbcebe996a56504')

package() {
  install -Dm755 fnm "$pkgdir/usr/bin/fnm"
}
