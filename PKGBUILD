# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.6.2
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built in ReasonML "
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git')
source=("https://github.com/Schniz/fnm/releases/download/v$pkgver/$_pkgname-linux.zip")
md5sums=('e957445fa7dc51665b07aee1301ae5c5')

package() {
  install -Dm755 fnm-linux/fnm "$pkgdir/usr/bin/fnm"
}
