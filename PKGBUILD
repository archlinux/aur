# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=informant
pkgver=0.0.7
pkgrel=1
pkgdesc="An Arch Linux News reader and pacman hook"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('python' 'python-docopt' 'python-dateutil' 'python-feedparser')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e1593c67a515e5adafaab85c01c8241614d316c4c759e2bf3fef36e710a5c3af')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 $pkgname -t $pkgdir/usr/bin/
    install -Dm 0644 $pkgname.hook -t $pkgdir/usr/share/libalpm/hooks/
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
