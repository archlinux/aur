# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=blueranger
_pkgname=BlueRanger
pkgver=1.0
pkgrel=5
pkgdesc="A simple Bash script which uses Link Quality to locate Bluetooth device radios."
url="https://github.com/GIJack/BlueRanger"
arch=('any')
license=('GPLv2')
depends=('bash' 'bluez-utils' 'bluez-hcitool')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/BlueRanger/archive/v${pkgver}.tar.gz")
sha512sums=('67463034f3656ef0155a3272851a1cf0beb69a35d9dedc892f660e4cc28c55d6703454ad7c52888fcb240d6cd01292ee2a5057ee97ceac1c6c011ed0084ba39f')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm755 blueranger.sh "$pkgdir/usr/bin/blueranger"
}
