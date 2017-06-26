# Maintainer: Marcin Kornat <rarvolt+aur@gmail.com>
# Contributor: MatejSpindler <spindler.matej@gmail.com>

pkgname=esptool-git
pkgver=2.0.1
pkgrel=1
pkgdesc="A cute Python utility to communicate with the ROM bootloader in Espressif ESP8266"
arch=('any')
url="https://github.com/espressif/esptool"
license=('GPL2')
makedepends=('git')
depends=('python' 'python-pyserial')
source=(esptool::git+https://github.com/espressif/esptool)
md5sums=('SKIP')

package() {
  cd "${srcdir}/esptool"
  python3 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}

