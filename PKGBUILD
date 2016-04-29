# Maintainer: getmicah (https://micahcowell.com)
pkgname=spotify-now
_pkgname=spotify-now
pkgver=1.0
pkgrel=1
pkgdesc="Get information on the current Spotify song"
arch=('any')
url="https://github.com/getmicah/spotify-now"
license=('MIT')
conflicts=('spotify-now-git')
source=("spotify-now")
md5sums=('8505cbb6dea332f8837c5596bb7e305a')

package() {
  install -Dm755 "$pkgdir/usr/bin" "$srcdir/spotify-now"
}
