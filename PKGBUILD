# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.7.1
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built in ReasonML "
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git')
source=("https://github.com/Schniz/fnm/releases/download/v$pkgver/$_pkgname-linux.zip")
md5sums=('4e9ea03fa2bf0e9abb59776639b130b1')

package() {
  install -Dm755 fnm-linux/fnm "$pkgdir/usr/bin/fnm"
}
