# Maintainer: Erik Sonnleitner <es at delta-xi dot net>

pkgname=morgen-bin
pkgver=3.1.3
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("https://dl.todesktop.com/210203cqcj00tw1/linux/deb/x64" morgen)
b2sums=('5a4b2e6191d4a3b82bd5cc187754d93e2b5f611a720ff47a310357e0cfc00511774a6b7266b6d1efb794dd9c4891e3fbdcb6e31b6f6865dfe51134b166f72457'
        'ad953f1507c74e71ef2580e8b7c94fe4ea3a77e547f3c459adc7966df84e911fdc35fcf8ca708a28fd42c46999cf395f264333d441da5b4fc7d5644b3779ccdd')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

