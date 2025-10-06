# Maintainer: AdvaScriptCC
pkgname=thinkpad-motherboard-fru-reader
pkgver=1.4
pkgrel=1
pkgdesc="Read ThinkPad FRU information (model and serial) from EEPROM. Simple script."
arch=('x86_64')
license=('MIT')
depends=('i2c-tools')
source=('read_fru.sh')
sha256sums=('SKIP')

package() {
    install -Dm755 read_fru.sh "$pkgdir/usr/bin/read_fru"
}
