# Maintainer: Radostin Stoyanov <rstoyanov1 at gmail dot com>
pkgname=youtube-dl-mp3
pkgver=2017.02.11
_appname=youtube-dl-mp3
_release=2017.02.11
pkgrel=1
pkgdesc="Short way to download best quality mp3 from youtube"
arch=('any')
url="https://github.com/rst0git/youtube-dl-mp3"
license=('MIT')
depends=('youtube-dl')
options=("!strip")
source=(${pkgname})
md5sums=('e372f4ae1c4288207639fa84885166a0')

package() {
  install -Dm755 ${pkgname} $pkgdir/usr/bin/${pkgname}
}
