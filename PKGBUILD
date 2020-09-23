# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=baffbf68fdb8fb3745f260154d0baf9e2b0c3c75
pkgrel=2
pkgdesc="A simple command line tool for reading and writing AT24/EE1004 SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('e60aaaec492a1ff0e57c4498b7e3dabc541f6a07ad13b392645f1a93e6c9ac233df96657072e8da3fa8848aee7915f78a5e276151c3b79b1fb98e44560c6ef7f')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
