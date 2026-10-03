# Maintainer: aetherherne <aetherherne@gmail.com>

pkgname=modorganizer2-installer-bin
pkgver=7.0.1
pkgrel=1
pkgdesc="An accessible installer for mod organizer 2, intended to make it easy to get modding"
arch=('x86_64')
url="https://github.com/Furglitch/modorganizer2-linux-installer"
license=('GPL-3.0')
depends=('xdg-utils' 'procps-ng' 'cabextract' 'protontricks' 'winetricks')
source=("mo2-lint-${pkgver}::https://github.com/Furglitch/modorganizer2-linux-installer/releases/download/${pkgver}/mo2-lint")
b2sums=('35c966aa2e9e1976018dba2cc6ade839e7b4aeef894a26a89174e9aa1a79d64172b9bc63f0630ad096198e620873b68706b7ca7f6ed3b13e7caa39ac276646da')

package() {
  ls -la
    install -Dm755 mo2-lint-${pkgver} "$pkgdir/usr/bin/mo2-lint"
}
