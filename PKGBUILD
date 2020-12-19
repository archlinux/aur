# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=python-nanopi-gpio-git
pkgver=0.6.3
pkgrel=3
pkgdesc="Python library for GPIO access on a Nano Pi"
url="https://github.com/auto3000/RPi.GPIO_NP"
license=(MIT)
provides=("python-raspberry-gpio")
conflicts=("python-raspberry-gpio")
arch=(armv6h armv7h)
depends=('python')
makedepends=('gcc' 'python-setuptools')
source=("git://github.com/auto3000/RPi.GPIO_NP/")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/RPi.GPIO_NP"
	CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

