# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=d2f896095e5303993f379ddbfdf9bb30616f2f98
pkgrel=2
pkgdesc="A simple command line tool for reading and writing AT24/EE1004 SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('37dbd5d5c060878db812bd4496db0eb0b2ebb81f7a366ae9adb30bc601354d754d0ce0fecdd47b82916237ecc1a4cff25ffdecdbd05a369f0eb3dcf452fb9866')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
