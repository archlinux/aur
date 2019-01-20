pkgname=pishrink-git
_name=pishrink
pkgver=20190120
pkgrel=1
pkgdesc="Make your pi images smaller!"
depends=()
license=('MIT')
arch=('any')
url="https://github.com/Drewsif/PiShrink"
source=(${pkgname}::git+$url)
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 pishrink.sh "$pkgdir/usr/bin/pishrink.sh"
}
