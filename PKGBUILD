# Maintainer: Erik Sonnleitner <es at delta-xi dot net>

pkgname=morgen-bin
pkgver=2.2.3
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("https://download.todesktop.com/210203cqcj00tw1/morgen-${pkgver}.deb" morgen)
b2sums=('e9f911c39599a37e8f980127449bc8e9cfa752e7d671032cb2be2b2248bb4a79c237b02ce9d85ad9fa8b76894719faef869686f203441d531cb605e4c4dcf58a'
        '22bb3535edf2320bcb51a81e8865b0775b129ff1fad8007c6c9f385f4cdc241b0d166dd8e51a700ad7a1bf72efdcb2d5a13bb3b39ec8aa2db0a71fc22dfeeb57')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

