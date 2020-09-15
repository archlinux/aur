# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=96a266a4f7ab591ac75964367d6cd2827358a347
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SPD EEPROM."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('f09a8b174db2276a368904f6356d4f6a9579bc2996688714ac137f629e2c42ab51818be72ca2549c7f65e8c496c6d554fb83dfea423f20da30385a3a6f9f71ed')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
