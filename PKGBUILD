# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>

pkgname='mprop-git'
pkgver=1.1
pkgrel=1
epoch=1
pkgdesc="xprop like tool for maomaowm (get window id and title)"
arch=('any')
url="https://github.com/DreamMaoMao/mprop"
license=('MIT')
depends=('wlrctl' 'slurp' 'mangowc-git')
makedepends=('git') 
source=('git+https://github.com/DreamMaoMao/mprop.git')
sha256sums=('SKIP')

package() {
    cd "$srcdir/mprop"
    install -Dm755 mprop "$pkgdir/usr/bin/mprop"
}
