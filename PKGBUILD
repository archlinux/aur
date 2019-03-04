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
md5sums=('a57f9f72b4d855a2bd020597be517edb')

package() {
  install -Dm755 fnm-linux/fnm "$pkgdir/usr/bin/fnm"
}
