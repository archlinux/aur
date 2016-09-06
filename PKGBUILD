# Maintainer: Giampaolo Mancini <giampaolo@trampolineup.com>
pkgname=python-gpiozero
pkgver=1.3.1
pkgrel=1
pkgdesc='A simple interface to everyday GPIO components used with Raspberry Pi.'
arch=('any')
url="https://github.com/RPi-Distro/$pkgname"
license=('BSD')
groups=()
depends=('python')
makedepends=('python-distribute')
source=("https://github.com/RPi-Distro/python-gpiozero/archive/v$pkgver.tar.gz")
md5sums=('54ecab566d060abc6e635f421a63a8a2')

package() {
      cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="$pkgdir/" --optimize=1
    }

# vim:set ts=2 sw=2 et:
