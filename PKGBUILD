# Maintainer: aetherherne <aetherherne@gmail.com>

pkgname=modorganizer2-installer-bin
pkgver=7.0.0
pkgrel=1
pkgdesc="An accessible installer for mod organizer 2, intended to make it easy to get modding"
arch=('x86_64')
url="https://github.com/Furglitch/modorganizer2-linux-installer"
license=('GPL-3.0')
depends=('xdg-utils' 'procps-ng' 'cabextract' 'protontricks' 'winetricks')
source=("mo2-lint-${pkgver}::https://github.com/Furglitch/modorganizer2-linux-installer/releases/download/${pkgver}/mo2-lint")
b2sums=('51e5f4a968b7ca283fa7dd39e77bb36dda09ceb010b5012819f6258eedbc7022967d3cfc5570551dd9e9994de1ea20afa0ebeca18d3fb487712ea207d9a891f0')

package() {
  ls -la
    install -Dm755 mo2-lint-${pkgver} "$pkgdir/usr/bin/mo2-lint"
}
