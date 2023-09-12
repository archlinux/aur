# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-drupalconsole

_pkgname=drupalconsole
pkgname=${_pkgname}
pkgver=1.9.10
pkgrel=2
pkgdesc="The Drupal Console is a suite of tools that you run on a command line interface (CLI) to generate boilerplate code and interact with a Drupal 8 installation."
arch=('any')
url="http://drupalconsole.com/"
license=('GPL')
depends=('php>=5.9.5')
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver//_/-}"::"https://drupalconsole.com/installer")
sha512sums=('a58e78621b9e1bccb181641682c2c66356b2559638ebe2272c0d8f9302e4f973b70a77d2ce5f7e83e346d475ad4ab95fc90a77c0b09c40908af0c8d1c9597147')

package() {
  install -D -m755 "${_pkgname}-${pkgver//_/-}" "${pkgdir}/usr/bin/drupal"
}
