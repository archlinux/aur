# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=spd-eeprom
pkgver=0.0.0.20200915
_commit=5c49fd3d752ea9c0740d8d62029da20b470c8233
pkgrel=2
pkgdesc="A simple command line tool for reading and writing AT24/EE1004 SPD EEPROMs."
arch=('any')
url="https://github.com/redchenjs/spd-eeprom"
license=('Apache')
depends=('python')
source=("https://github.com/redchenjs/spd-eeprom/archive/$_commit/spd-eeprom-$_commit.tar.gz")
sha512sums=('1238e762b47d264d46d8ede74d80af035fe76e89ba7c5cd66508af0a42eb86fc10c440d3d4d607b28d9cf9e4967a6993c517f63fa5b14051a2a17a88cae812c8')

package() {
  cd "$pkgname-$_commit"

  install -Dm755 spd-eeprom.py "$pkgdir/usr/bin/spd-eeprom.py"
}
