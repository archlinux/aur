# Maintainer: Dreieck

pkgname=linux-dummy
pkgver=4.16.10
pkgrel=1
pkgdesc="A dummy package just providing a logic dependency. Makes the system assume that the package 'linux' is there even if it is not. \$pkgver of package 'linux' available in pacman -Si linux will be used."
arch=('any')
license=('none')
provides=("linux=${pkgver}")

pkgver() {
  pacman -Sqi linux | grep -E '^Version[[:space:]]+\:' | head -n 1 | awk -F':' '{print $2}' | awk -F'-' '{print $1}' | tr -d '[[:space:]]'
}

build()
{
  true
}

package()
{
  true
}
