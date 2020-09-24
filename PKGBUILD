# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=8e423b4887b20bbb7d8d5767aa85dd7f2fd71286
pkgrel=2
pkgdesc="A simple command line tool for reading and writing AT24/EE1004 SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('b60a6077d7fdf43f122caf50686f574775787c75ce50292e6f15c31cfe69c5dd54075b83a20339958beebbc96f3a401c68fa66fad11d57862bea26e5a1eeb74c')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
