# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=b9b4c94c574bc383ddb0c63fcb6b00be521cf8cb
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SPD EEPROM."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('f1fd4f25014e0fbe24fc44ef115794575947a6aa193bf57522abbcacf5903828b51b3706df2e9d279892575a94c6110f4232397a99f5f4279bd6b820bb05dd01')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
