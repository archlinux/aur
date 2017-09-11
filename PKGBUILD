# Maintainer: Giampaolo Mancini <giampaolo@trampolineup.com>
pkgname=python-gpiozero
pkgver=1.4.0
pkgrel=1
pkgdesc='A simple interface to everyday GPIO components used with Raspberry Pi.'
arch=('any')
url="https://github.com/RPi-Distro/$pkgname"
license=('BSD')
groups=()
depends=('python')
makedepends=('python-distribute')
source=("https://github.com/RPi-Distro/python-gpiozero/archive/v$pkgver.tar.gz")
sha256sums=('7af2f049d0f16357b283620eab5a14925680cbf799d0a37093332686bf470227')

package() {
      cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="$pkgdir/" --optimize=1
    }

# vim:set ts=2 sw=2 et:
