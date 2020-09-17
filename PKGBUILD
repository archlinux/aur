# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=46804aaef42327c9b51354d74936e22dadb7241a
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SDR/DDR/DDR2/DDR3/DDR4 SDRAM SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('d4fdd752a996efc7be9d02cc9b1f641e188ce7ee888359615b7cbd6ca71dc06d3407fdc3d1412978b915d3988612ccf417f0adb990ec89d113f242cca3b5ed7f')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
