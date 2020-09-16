# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=36dc8534deb7124a2bb8d0000db56e8a4a90f3ef
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('7cb0d5b5c12aefcfad13f6a84cb5937cf398679daf77e705771c4a1c70b267da8ae4c3b3f7bd031aafced9b41e1b1c1e0509e492f63d523d6b22fd5748fee42a')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
