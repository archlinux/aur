# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.30.1
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git' 'fnm')
source=("$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
md5sums=('05c7333ec8d7f9c61e57588c02382816')

package() {
  install -Dm755 fnm "$pkgdir/usr/bin/fnm"
}
