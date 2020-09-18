# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=a6658e06e93fc56d4ac1a079cd3fcdeee3303039
pkgrel=1
pkgdesc="A simple command line tool for reading and writing AT24/EE1004 SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('2fa6c66145107a723df01b9070cb1ff508571bfda0aa691016fc6246a72fea0667271fdaa258cbdc9355a8089c4f18aaca7303eb6d9949bc1a632f765fcddd41')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
