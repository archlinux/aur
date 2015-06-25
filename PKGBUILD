# Maintainer: Thomas Nordenmark <t.nordenmark@gmail.com>
pkgname=svtget
pkgver=0.1.6
pkgrel=1
pkgdesc="A free software tool to make local cache files of SVT Play web streams"
arch=('any')
url="http://svtget.se/"
license=('GPL3')
depends=('curl' 'rtmpdump' 'ffmpeg')
optdepends=(
  'mplayer: playing output with mplayer'
  'vlc: playing output with vlc'
  'avconv: alternative to ffmpeg'
)
source=('https://raw.github.com/mmn/svtget/master/bash/svtget')
md5sums=('351c38b343c49a303e1b9380349ac86a')

prepare() {
  sed -i 's/v0.1.5/v0.1.6/' svtget
}
     
package() {
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim: ts=2 sts=2
