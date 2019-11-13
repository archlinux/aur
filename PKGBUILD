# Maintainer: Steve Engledow <steve@offend.me.uk>
pkgname=maur
pkgver=0.1
pkgrel=1
pkgdesc='A minimal AUR helper'
url='http://github.com/stilvoid/maur'
arch=(any)
license=('MIT')
depends=('bash')
makedepends=('git')
source=('maur::git+https://github.com/stilvoid/maur.git')
sha256sums=('SKIP')

package() {
    install -Dm755 "maur/maur" "$pkgdir/usr/bin/maur"
}
