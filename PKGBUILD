# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=56be2d4054884ffe76f99c197cc7c9221aa2564f
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SDR/DDR/DDR2/DDR3/DDR4 SDRAM SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('fa6b3db638f8e440a7680a9191f3fb3ac9b4b2cdce1df3de58e73b97d12ce2f8277c108c1bf0b19a4b27fc31a48fadb16e6d68ef467442474a76c54453b2aa5a')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
