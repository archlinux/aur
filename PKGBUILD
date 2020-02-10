# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=huawei-me936-udev
pkgver=1.0
pkgrel=2
pkgdesc="udev Rule for Huawei ME936 LTE Modul"
url="https://raw.githubusercontent.com/StevenSeifried/udev-rules/master/77-huawei-me936.rules"
license=("GPL3")
arch=('any')
source=("https://raw.githubusercontent.com/StevenSeifried/udev-rules/master/77-huawei-me936.rules")
sha256sums=('1b38f7aa50438ef986cd3c701f06005ffe7d0ecbec98ab9aeb19b34c523d1ea3')
sha512sums=('0f4d72ffa1be210a2846aca5419764f137e91475b9070e4c21024ae82686d2a2b7c4c6358e861d380d20f5b52d88dc7412456993b12bfa0e6554e12fabb60f6e')
package() {
 install -Dm644 "$srcdir/77-huawei-me936.rules" "${pkgdir}/etc/udev/rules.d/77-huawei-me936.rules"
}
