# Maintainer: NoverPlay Team <vlad22887798@gmail.com>
pkgname=noverplay-bin
pkgver=1.0.6
pkgrel=1
pkgdesc='NoverPlay desktop music player'
arch=('x86_64')
url='https://noverplay.space'
license=('custom:proprietary')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'openssl' 'hicolor-icon-theme')
optdepends=('yt-dlp: optional media extraction helper')
provides=('noverplay')
conflicts=('noverplay')
options=('!strip')
source_x86_64=("noverplay-${pkgver}-x86_64.tar.gz::https://noverplay.space/download/linux/noverplay-1.0.6-x86_64.tar.gz")
sha256sums_x86_64=('2c58da356bd55f71f5f0984658fe50e87b6f41f0384947d34001813a771ffa19')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
}
