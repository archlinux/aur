# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=helmup-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Check your helm chart dependencies for updates and apply them with an interactive selection."
arch=('x86_64')
url="https://github.com/rubengees/helmup"
license=('MIT')
source=(helmup::https://github.com/rubengees/helmup/releases/download/0.1.2/helmup-0.1.2-linux-amd64)
md5sums=(9106d5c0bda83a4cc1a6b4c15e3c3c38)

package() {
  install -Dm755 "helmup" "$pkgdir/usr/bin/helmup"
}
