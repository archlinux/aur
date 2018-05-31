# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=mpfshell
pkgver=0.8.1
pkgrel=1
pkgdesc="A simple shell based file explorer for ESP8266 Micropython based devices"
arch=('any')
url="https://github.com/wendlers/mpfshell"
license=('MIT')
depends=('python' 'python-pyserial' 'python-colorama' 'python-websocket-client')
options=(!emptydirs)
source=("https://github.com/wendlers/mpfshell/archive/${pkgver}.tar.gz")
sha512sums=('a9107c031431eab53f514e6b16adb19551f0058d43b03e3fd1100faa3013f1fdcbcd5aca45e4dcc73ee5a318f40ae611eb0ad17eff9178fcfe65a093f581c6a5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
