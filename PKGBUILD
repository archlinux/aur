# Maintainer: Dreieck

pkgname=linux-api-headers-dummy
pkgver=4.16.1
pkgrel=1
pkgdesc="A dummy package just providing a logic dependency. Makes the system assume that the package 'linux-api-headers' is there even if it is not! \$pkgver of pacman -Si 'linux-api-headers' will be used."
arch=('any')
license=('none')
provides=("linux-api-headers=${pkgver}")

pkgver() {
  pacman -Sqi linux-api-headers | grep -E '^Version[[:space:]]+\:' | head -n 1 | awk -F':' '{print $2}' | awk -F'-' '{print $1}' | tr -d '[[:space:]]'
}

build()
{
  true
}

package()
{
  true
}

