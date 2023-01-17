# Maintainer Bigshans <wo199710@hotmail.com>

pkgname='elk-zone-bin'
pkgdesc='Native version of Elk, a nimble Mastodon web client.'
url='https://github.com/elk-zone/elk-native'
pkgver=0.1.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
conflicts=('elk-zone-git')

source=("https://github.com/elk-zone/elk-native/releases/download/v${pkgver}/Elk_${pkgver}_linux_x86_64.deb")

sha256sums=('cfa54e6011f85758bf7fcdfe6eff0276f0778d0ba7ed9709de0b80edb19eb873')

package() {
  tar -xvf ${srcdir}/data.tar.gz
  cp -r ${srcdir}/usr ${pkgdir}/
}
