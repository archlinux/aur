# Maintainer: Erik Sonnleitner <es at delta-xi dot net>

pkgname=morgen-bin
pkgver=3.6.9
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("${pkgname}_${pkgver}-${pkgrel}.xz::https://dl.todesktop.com/210203cqcj00tw1/linux/deb/x64" morgen)
b2sums=('9c84e2455a0ce6ad78fdc1fbc3e4e9c1db57b62f6e52bcf15cdd95b29aa2ace7b40c0cb15487d77a8240eca914fba2315cc23bcf140a176543c2aed0232c35ee'
        'ad953f1507c74e71ef2580e8b7c94fe4ea3a77e547f3c459adc7966df84e911fdc35fcf8ca708a28fd42c46999cf395f264333d441da5b4fc7d5644b3779ccdd')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

