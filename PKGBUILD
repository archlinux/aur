# Maintainer: Erik Sonnleitner <es at delta-xi dot net>

pkgname=morgen-bin
pkgver=2.1.6
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("https://download.todesktop.com/210203cqcj00tw1/morgen-${pkgver}.deb" morgen)
b2sums=('b0cf62ba737c7b38b86e8b60ad14f4e4b7fdc521bf439226abe7e77ddf9bbdc8bd9436b8fe0bb8732ae938fd1c02a8fb112d119d96f8c14aceed74502feaff9c'
        '22bb3535edf2320bcb51a81e8865b0775b129ff1fad8007c6c9f385f4cdc241b0d166dd8e51a700ad7a1bf72efdcb2d5a13bb3b39ec8aa2db0a71fc22dfeeb57')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

