# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit_nokia_lcd
pkgver=0.1.0
pkgrel=1
pkgdesc='Python library for the using the Nokia 5110/3310 monochrome graphic LCD with a Raspberry Pi or Beaglebone Black'
url='https://github.com/adafruit/Adafruit_Nokia_LCD'
arch=('armv6h' 'armv7h' 'x86' 'x86_64')
license=('MIT')
depends=('python')
source=("git://github.com/adafruit/Adafruit_Nokia_LCD")
md5sums=('SKIP')

package() {
  cd Adafruit_Nokia_LCD
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
