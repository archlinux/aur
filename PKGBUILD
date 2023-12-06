# Maintainer: Erik Sonnleitner <es at delta-xi dot net>

pkgname=morgen-bin
pkgver=3.1.3
pkgrel=2
pkgdesc='Morgen is a modern, intuitive and smart calendar application and successor to MineTime'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
source=("https://dl.todesktop.com/210203cqcj00tw1/linux/deb/x64" morgen)
b2sums=('44ee8f28ba6dad62fa00722813166c97497e9f0c018896aabd5223e1d67ef3a11d71f7aa3c23dc06cfcb155a88b20dfd3363297dd7c897194c9ceb14524bd4ec'
        'ad953f1507c74e71ef2580e8b7c94fe4ea3a77e547f3c459adc7966df84e911fdc35fcf8ca708a28fd42c46999cf395f264333d441da5b4fc7d5644b3779ccdd')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}

