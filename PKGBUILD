# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=219f57e6744e9fd90b035abc83e81134f5fe95c9
pkgrel=2
pkgdesc="A simple command line tool for reading and writing AT24/EE1004 SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('56f214bc3a77f179ec5e3a13bfdaa01918a16dfd3ab0022850ecbf8e4ef68ab986b63d503a27968fc0063e8f88c22eb33e401d7ac6a008115f4ecfee4620a1c2')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
