# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=helmup-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Check your helm chart dependencies for updates and apply them with an interactive selection."
arch=('x86_64')
url="https://github.com/rubengees/helmup"
license=('MIT')
source=(helmup::https://github.com/rubengees/helmup/releases/download/0.1.3/helmup-0.1.3-linux-amd64)
md5sums=(35c6e73b6c75ab72ff9cbbc24d09445d)

package() {
  install -Dm755 "helmup" "$pkgdir/usr/bin/helmup"
}
