# Maintainer: Erik Sonnleitner <es at delta-xi dot net>
# Thanks to  Aliaksei Zhordachkin <aliaksei.here@gmail.com> for the patch allowing direct version access

pkgname=morgen-bin
pkgver=3.6.16
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("${pkgname}_${pkgver}-${pkgrel}.xz::https://dl.todesktop.com/210203cqcj00tw1/versions/${pkgver}/linux/deb/x64" morgen)
b2sums=('dfd3903ab8e3422101b9d4a99f9766596718a5a6974bc44fa5b8d28497c9602c1ee4a0dc0db95ed7e8315a1bf3e369c42590d316aa0623f51de1fe7f24992716'
        'ad953f1507c74e71ef2580e8b7c94fe4ea3a77e547f3c459adc7966df84e911fdc35fcf8ca708a28fd42c46999cf395f264333d441da5b4fc7d5644b3779ccdd')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

