# Maintainer: Erik Sonnleitner <es at delta-xi dot net>

pkgname=morgen-bin
pkgver=2.5.5
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("https://download.todesktop.com/210203cqcj00tw1/morgen-${pkgver}.deb" morgen)
b2sums=('e50a92037e79a4972e9929b3c55237121a66964e922339037882161e21e9c56140c8d501fc95f2d6a3a3db1ad6367a4091331058bcc04d4dfab7fd72f207315e'
        '22bb3535edf2320bcb51a81e8865b0775b129ff1fad8007c6c9f385f4cdc241b0d166dd8e51a700ad7a1bf72efdcb2d5a13bb3b39ec8aa2db0a71fc22dfeeb57')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

