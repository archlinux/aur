# Maintainer: Ruben Gees <rubengees7@gmail.com>

pkgname=helmup-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Check your helm chart dependencies for updates and apply them with an interactive selection."
arch=('x86_64')
url="https://github.com/rubengees/helmup"
license=('MIT')
source=(https://github.com/rubengees/helmup/releases/download/0.1.1/helmup-0.1.1-linux-amd64)
md5sums=(e4b7d601489a34feddf345cf128f2978)

package() {
  install -Dm755 "helmup" "/usr/bin/helmup"
}
