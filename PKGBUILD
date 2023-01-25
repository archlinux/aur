# Maintainer Bigshans <wo199710@hotmail.com>

pkgname='elk-zone-bin'
pkgdesc='Native version of Elk, a nimble Mastodon web client.'
url='https://github.com/elk-zone/elk-native'
pkgver=0.3.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
conflicts=('elk-zone-git')

source=("https://github.com/elk-zone/elk-native/releases/download/elk-native-v${pkgver}/Elk_${pkgver}_linux_x86_64.deb")

sha256sums=('b2110315044b9abbd7bc1c7be5b38605dd9081ecb08469d229f473dc18e6f1a0')

package() {
  tar -xvf ${srcdir}/data.tar.gz
  cp -r ${srcdir}/usr ${pkgdir}/
}
