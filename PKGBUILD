# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=progress-quest-bin
pkgver=6.4.3
pkgrel=1
pkgdesc='Progress Quest is an antic and fantastical computer role-playing game'
arch=('i686' 'x86_64')
url='http://progressquest.com/'
license=('MIT')
makedepends=('unzip')
depends=('wine')
source=(
    'http://www.progressquest.com/dl/pq6-4-3.zip'
    'progress-quest'
)
sha256sums=(
    'b425ce40f2c19d5c853ce2a54f3f208431843e3240da4d38f9cfcba006e016b8'
    '91fc83b000b581fd29295d99ab3253b40e6f6a94f39c557ae7ed80f7c8bb5702'
)

package() {
  install -Dm755 "pq.exe" "$pkgdir/usr/share/progress-quest/pq.exe"
  install -Dm755 "progress-quest" "$pkgdir/usr/bin/progress-quest"
}
