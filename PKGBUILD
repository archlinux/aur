# Maintainer: aetherherne <aetherherne@gmail.com>

pkgname=modorganizer2-installer-bin
pkgver=7.1.0+hf1
pkgrel=1
pkgdesc="An accessible installer for mod organizer 2, intended to make it easy to get modding"
arch=('x86_64')
url="https://github.com/Furglitch/modorganizer2-linux-installer"
license=('GPL-3.0')
depends=('xdg-utils' 'procps-ng' 'cabextract' 'protontricks' 'winetricks')
source=("mo2-lint-${pkgver}::https://github.com/Furglitch/modorganizer2-linux-installer/releases/download/${pkgver}/mo2-lint")
b2sums=('9738d384f0a2f07bc01610d90d9b05c58740475c41dce4a3508de4dc3974f1552d10e6fcd3b91670232715a8644f4eac2f306b6338495ab1245f414e3a923201')

package() {
  ls -la
    install -Dm755 mo2-lint-${pkgver} "$pkgdir/usr/bin/mo2-lint"
}
