# Maintainer: Erik Sonnleitner <es at delta-xi dot net>
# Thanks to  Aliaksei Zhordachkin <aliaksei.here@gmail.com> for the patch allowing direct version access

pkgname=morgen-bin
pkgver=3.6.15
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("${pkgname}_${pkgver}-${pkgrel}.xz::https://dl.todesktop.com/210203cqcj00tw1/versions/${pkgver}/linux/deb/x64" morgen)
b2sums=('1cdaff2c2d9a493486bedd6de969e4cec2450a1e62eb4aa4c97c8ae00fcd79707a7e4184e73c902fb901184cfae8f01cbbc5ecf71a723b284814778a44da4c0f'
        'ad953f1507c74e71ef2580e8b7c94fe4ea3a77e547f3c459adc7966df84e911fdc35fcf8ca708a28fd42c46999cf395f264333d441da5b4fc7d5644b3779ccdd')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

