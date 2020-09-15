# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=8845633f820b86db8a9ce649c2329c4a59bb0f55
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SPD EEPROM."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('0a79b317075b0a4fbcfa3ba64fb38c251912fa6276cb02a22f0d0f64c8f5d1cf658dd8e4532d1a55863ba707f8a5230e6677a7a7fce4ea7171d939c0c0cd5402')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
