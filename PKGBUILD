# Maintainer: Steve Engledow <steve@engledow.me>
pkgname=progress-quest-bin
pkgver=6.2
pkgrel=1
pkgdesc='Progress Quest is an antic and fantastical computer role-playing game'
arch=('i686' 'x86_64')
url='http://progressquest.com/'
license=('MIT')
makedepends=('unzip')
depends=('wine')
source=(
    'http://www.grumdrig.com/dl/pq6-2.zip'
    'progress-quest'
)
sha256sums=(
    '85f8e5e4735f0faf8d84ac1267ec64a9a92265a9033dd3c93d988dbe3eb1c716'
    '91fc83b000b581fd29295d99ab3253b40e6f6a94f39c557ae7ed80f7c8bb5702'
)

package() {
  install -Dm755 "pq.exe" "$pkgdir/usr/share/progress-quest/pq.exe"
  install -Dm755 "progress-quest" "$pkgdir/usr/bin/progress-quest"
}
