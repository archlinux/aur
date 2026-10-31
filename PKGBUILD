# Maintainer: aetherherne <aetherherne@gmail.com>

pkgname=modorganizer2-installer-bin
pkgver=7.0.5
pkgrel=1
pkgdesc="An accessible installer for mod organizer 2, intended to make it easy to get modding"
arch=('x86_64')
url="https://github.com/Furglitch/modorganizer2-linux-installer"
license=('GPL-3.0')
depends=('xdg-utils' 'procps-ng' 'cabextract' 'protontricks' 'winetricks')
source=("mo2-lint-${pkgver}::https://github.com/Furglitch/modorganizer2-linux-installer/releases/download/${pkgver}/mo2-lint")
b2sums=('9f63868510a33520efe3abf08c13ba088d3360ebe6b5cdb4cc107da086aeababf578b769af9ace3432afa2b529626271ac22223e53a53d8999d3b4383ffe365b')

package() {
  ls -la
    install -Dm755 mo2-lint-${pkgver} "$pkgdir/usr/bin/mo2-lint"
}
