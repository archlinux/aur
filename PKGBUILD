# Maintainer: Radostin Stoyanov <rstoyanov1 at gmail dot com>
pkgname=youtube-dl-mp3
pkgver=2017.04.5
_appname=youtube-dl-mp3
_release=2017.04.5
pkgrel=1
pkgdesc="Downloads videos from YouTube and convert them to mp3."
arch=('any')
url="https://github.com/rst0git/youtube-dl-mp3"
license=('MIT')
depends=('youtube-dl')
options=("!strip")
source=(${pkgname})
md5sums=('d602848d18fdb089736644f16c26ecea')

package() {
  install -Dm755 ${pkgname} $pkgdir/usr/bin/${pkgname}
}
