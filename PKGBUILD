# Maintainer: Dreieck

pkgname=linux-firmware-dummy
pkgver=20180507.8fc2d4e
pkgrel=1
pkgdesc="A dummy package just providing a logic dependency. Makes the system assume that the package 'linux-firmware' is there even if it is not! \$pkgver of pacman -Si 'linux-firmware' will be used."
arch=('any')
license=('none')
provides=("linux-firmware=${pkgver}")

pkgver() {
  pacman -Sqi linux-firmware | grep -E '^Version[[:space:]]+\:' | head -n 1 | awk -F':' '{print $2}' | awk -F'-' '{print $1}' | tr -d '[[:space:]]'
}

build()
{
  true
}

package()
{
  true
}
