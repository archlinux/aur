# Maintainer Bigshans <wo199710@hotmail.com>

pkgname='elk-zone-bin'
pkgdesc='Native version of Elk, a nimble Mastodon web client.'
url='https://github.com/elk-zone/elk-native'
pkgver=0.2.1
pkgrel=1
arch=('any')
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
conflicts=('elk-zone-git')

source=("https://github.com/elk-zone/elk-native/releases/download/elk-native-v${pkgver}/Elk_${pkgver}_linux_x86_64.deb")

sha256sums=('14b60198ca270bc59ac44e87365068159ac08d8707858dff22592b06499fe4e3')

package() {
  tar -xvf ${srcdir}/data.tar.gz
  cp -r ${srcdir}/usr ${pkgdir}/
}
