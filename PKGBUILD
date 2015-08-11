# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=lm4flash
pkgver=0.1.3
pkgrel=1
pkgdesc="Firmware flashing tool for Stellaris Launchpad ICDI"
arch=('x86_64' 'i686')
url="https://github.com/utzig/lm4tools"
license=('GPL')
depends=('libusb')
source=('https://github.com/utzig/lm4tools/raw/1cfd813779b9eb717b15b0a1814bde8338899ff9/lm4flash/lm4flash.c'
        'https://github.com/utzig/lm4tools/raw/1cfd813779b9eb717b15b0a1814bde8338899ff9/lm4flash/Makefile')
md5sums=('7c42ef2446f4202f59397bbe13c5311f'
         'a775a7a14a2856afa3325c04d627fdbe')

build() {
  make
}

package() {
  install -Dm755 "$srcdir/lm4flash" "$pkgdir/usr/bin/lm4flash"
}
