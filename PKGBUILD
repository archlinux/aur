# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=e22fc92720fbe55e3f7bec987491a7be5de9ef6e
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SPD EEPROM."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('8dea6826e88c32f006fc6e94b994ff64fea93c8e3958bbd419e43c6f49e1d29c0d68b33f58154dd3edf097f37150a049ee7f638d158d7e4afe5417524b43382e')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
