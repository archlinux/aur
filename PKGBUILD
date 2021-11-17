# Maintainer: Jarasłaŭ Viktorčyk <ugzuzg@gmail.com>
pkgname=fnm-bin
_pkgname=fnm
pkgver=1.28.1
pkgrel=1
pkgdesc="Fast and simple Node.js version manager, built in Rust"
arch=('x86_64')
url="https://github.com/Schniz/fnm"
license=('GPL3')
provides=('fnm')
conflicts=('fnm-git' 'fnm')
source=("$_pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_pkgname-linux.zip")
md5sums=('0999bd503c3f7134ea62bc7d0620ed23')

package() {
  install -Dm755 fnm "$pkgdir/usr/bin/fnm"
}
