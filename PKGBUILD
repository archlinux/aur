# Maintainer: Cody Bond <cbbond@outlook.com>

pkgname=newsie
pkgver=0.2
pkgrel=1
pkgdesc="A command line utility for accessing Arch newsfeed posts."
arch=("any")
url="https://github.com/cbbond/$pkgname"
license=('MIT')
depends=("python" "python-docopt" "python-feedparser")
source=("https://github.com/cbbond/$pkgname/archive/$pkgver.tar.gz")
md5sums=('631c2d2a62488885aafb2ba941cb041a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 $pkgname -t $pkgdir/usr/bin/
    install -Dm 0644 $pkgname.hook -T $pkgdir/usr/share/libalpm/hooks/00-$pkgname.hook
    install -Dm 0644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
}
