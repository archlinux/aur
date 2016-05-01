# Maintainer: Andrew Titmuss <andrew@coffeetocode.me>
pkgname=gpmdp-bash
pkgver=1.0.1
pkgrel=1
pkgdesc="Bash script for printing info from Google Play Music Desktop Player"
arch=('any')
url="https://github.com/iandrewt/gpmdp-bash"
license=('MIT')
depends=('google-play-music-desktop-player-git')
install=$pkgname.install
source=(https://github.com/iandrewt/gpmdp-bash/archive/v$pkgver.tar.gz)
md5sums=('13b09fdd7a663b07d8f836dcba507c9d')

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
