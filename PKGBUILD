# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=3ccbb86ab9b6847b622a260060b962d0f316c32e
pkgrel=1
pkgdesc="A simple command line tool for reading and writing AT24/EE1004 SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('c5078ecb3e78ccd3d1c41af16cd5286a206f9e5faa3b9ec2a6579acf34281df825148ae6917df87febf90923ecbef7e13bfca373f2740d79f939eea6fe573306')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
