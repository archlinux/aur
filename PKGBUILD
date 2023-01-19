# Maintainer Bigshans <wo199710@hotmail.com>

pkgname='elk-zone-bin'
pkgdesc='Native version of Elk, a nimble Mastodon web client.'
url='https://github.com/elk-zone/elk-native'
pkgver=0.2.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
conflicts=('elk-zone-git')

source=("https://github.com/elk-zone/elk-native/releases/download/elk-native-v${pkgver}/Elk_${pkgver}_linux_x86_64.deb")

sha256sums=('3578f59a7d3bb5d50d735f38c55a40a498bef65eb2a7fe68314b0f6fafd17e8a')

package() {
  tar -xvf ${srcdir}/data.tar.gz
  cp -r ${srcdir}/usr ${pkgdir}/
}
