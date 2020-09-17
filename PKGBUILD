# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=bc4992854a1fc22398aa23e56e61fb558ed1862c
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SDR/DDR/DDR2/DDR3/DDR4 SDRAM SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('2c985eb2f1c6a1873753023796f6c914131671d205d9826fafb603d6d3bc5b5d81d1b9f937e570cea89cfc29744ff701724c71246abd7bcfcad06c4f643ba742')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
