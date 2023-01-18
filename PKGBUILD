# Maintainer Bigshans <wo199710@hotmail.com>

pkgname='elk-zone-bin'
pkgdesc='Native version of Elk, a nimble Mastodon web client.'
url='https://github.com/elk-zone/elk-native'
pkgver=0.1.1
pkgrel=1
arch=('any')
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
conflicts=('elk-zone-git')

source=("https://github.com/elk-zone/elk-native/releases/download/v${pkgver}/Elk_${pkgver}_linux_x86_64.deb")

sha256sums=('0b568c2335eae268b5fd7cfb54381b11c97017a5de99f81ee188f5e65cacb8d9')

package() {
  tar -xvf ${srcdir}/data.tar.gz
  cp -r ${srcdir}/usr ${pkgdir}/
}
