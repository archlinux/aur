# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=988a16629ee3349f29236a8ffa729d51750d9c3a
pkgrel=1
pkgdesc="A simple command line tool for reading and writing SPD EEPROM."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python' 'i2c-tools')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('ea2cc35f5318868b4b656209e28e9af57fa1ff5bae25bfe0cdbdb1d3a5b55f83ab2a84248f076b0ccd73d29f48f504ca90c4d74e47ad2725a06f86346dd0eac7')

package() {
    cd $pkgname-$_commit
    install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
