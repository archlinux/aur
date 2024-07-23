# Maintainer: Erik Sonnleitner <es at delta-xi dot net>

pkgname=morgen-bin
pkgver=3.5.4
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("${pkgname}_${pkgver}-${pkgrel}.xz::https://dl.todesktop.com/210203cqcj00tw1/linux/deb/x64" morgen)
b2sums=('27ae052d2afe48c302106cbd19dbb84ee4ea28c44d7f695ab5c33adb0dd5bb1b92dcea810443c793f44f111a4134d898e688a60d986caa7e056258cfc2404636'
        'ad953f1507c74e71ef2580e8b7c94fe4ea3a77e547f3c459adc7966df84e911fdc35fcf8ca708a28fd42c46999cf395f264333d441da5b4fc7d5644b3779ccdd')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

