pkgname=mvjpngn
pkgver=1.0
pkgrel=2
pkgdesc="Prints Something"
arch=('any')
url="https://github.com/WallFacerer/mvjpngn"
license=('MIT')
depends=('python')
source=("mvjpngn" "pong")
sha256sums=('SKIP' 'SKIP')

package() {
    install -Dm755 mvjpngn "$pkgdir/usr/bin/mvjpngn"
    install -Dm755 pong "$pkgdir/usr/bin/pong"
}
