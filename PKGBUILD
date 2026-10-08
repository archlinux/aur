# Maintainer: aetherherne <aetherherne@gmail.com>

pkgname=modorganizer2-installer-bin
pkgver=7.0.3
pkgrel=1
pkgdesc="An accessible installer for mod organizer 2, intended to make it easy to get modding"
arch=('x86_64')
url="https://github.com/Furglitch/modorganizer2-linux-installer"
license=('GPL-3.0')
depends=('xdg-utils' 'procps-ng' 'cabextract' 'protontricks' 'winetricks')
source=("mo2-lint-${pkgver}::https://github.com/Furglitch/modorganizer2-linux-installer/releases/download/${pkgver}/mo2-lint")
b2sums=('4cd57bc78399825123dffef3725c05ab67e6791cceb1ca190b73c5fe15758b86529388e7eae370bbce15d6043bf2fb0805ca6ba6bf02652995022fb316cbb469')

package() {
  ls -la
    install -Dm755 mo2-lint-${pkgver} "$pkgdir/usr/bin/mo2-lint"
}
