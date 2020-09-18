# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=41f0fa7266f29bb4ef3aba30e52839fdd0e82d5e
pkgrel=1
pkgdesc="A simple command line tool for reading and writing AT24/EE1004 SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('9a0fe8f3596bbc9e0137b2928da7f71e12a7363454a79ba455c91d2ff4fb7cc6ee93159bda0a0934675c281c8c6429eebca6f40f244bbd2503147c9a3f7366e4')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
