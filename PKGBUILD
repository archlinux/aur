# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=5bbdbd48544cbf4167a8ae756ede136a898b165a
pkgrel=1
pkgdesc="A simple command line tool for reading and writing AT24/EE1004 SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('f16c2b8d06a534c3890dc19dc4e24e0623402721e0db34bf3366b6c5667d6f7402852627bd52a90cd7077b14c6c12a67fe022f579dc548a7637a5ee6a9bdf62f')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
