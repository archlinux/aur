# Maintainer: Bradford Smith <aur@bradfords.me>

pkgname=informant
pkgver=0.0.8
pkgrel=1
pkgdesc="An Arch Linux News reader and pacman hook"
arch=('any')
url="https://github.com/bradford-smith94/$pkgname"
license=('MIT')
depends=('python' 'python-docopt' 'python-dateutil' 'python-feedparser')
source=("https://github.com/bradford-smith94/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6889c378f5cf70be1fdfc4416b63ab76cff9e2c10318968b18d888b3af6768f6')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 $pkgname -t $pkgdir/usr/bin/
    install -Dm 0644 $pkgname.hook -t $pkgdir/usr/share/libalpm/hooks/
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
    install -Dm 0644 man/$pkgname.1 -t $pkgdir/usr/share/man/man1/
}
