# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=informant
pkgver=0.0.5
pkgrel=1
pkgdesc="An Arch Linux News reader and pacman hook"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('python' 'python-docopt' 'python-dateutil' 'python-feedparser')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('43f68f3e13bb37e22af235de14761bbf')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 $pkgname -t $pkgdir/usr/bin/
    install -Dm 0644 $pkgname.hook -t $pkgdir/usr/share/libalpm/hooks/
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
