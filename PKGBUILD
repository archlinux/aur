# Maintainer: Erik Sonnleitner <es at delta-xi dot net>

pkgname=morgen-bin
pkgver=2.5.9
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("https://download.todesktop.com/210203cqcj00tw1/morgen-${pkgver}.deb" morgen)
b2sums=('9cad08f6b4dfc75aa586a1a58872e629d6e35285718de7909b18b0ca1a9e9f8c712a8e5077edc91b87ac2511405d10c991d7dd644f56c0860f637291a3c3ee0a'
        'ad953f1507c74e71ef2580e8b7c94fe4ea3a77e547f3c459adc7966df84e911fdc35fcf8ca708a28fd42c46999cf395f264333d441da5b4fc7d5644b3779ccdd')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

