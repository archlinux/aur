# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=c37854918e5492713e8c3e02d6777263f408ba25
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SDR/DDR/DDR2/DDR3/DDR4 SDRAM SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('fe80a0d2955d7574fba2688c0af3e2888056654a163f1d7c0da52fc7d0b92b8c0a10f4d643db7c97b0c5878d237b7d1cccad9dd40a5eab9f2f2686c439338e1e')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
