# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=192fa2b6dd64ce6c4fc328af99c1924acdcb1876
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SPD EEPROM."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('5051de661be70b50ea9eaad4e70079f8747b04d7f4490c9f22064c480006a673995dbd7638beb0c14dfa631b47c0fd2513752012ca438503e69a4bcbbff7187a')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
