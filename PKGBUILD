# Maintainer: Josep Oliver Arlès <josep.oliver at tutanota dot com>

pkgname=hek
pkgver=0.0.2
pkgrel=1
pkgdesc="Check your music collection given a set of rules"
arch=("any")
url="https://github.com/dunon/hek"
license=("GPL3")
depends=("python" "python-mutagen")
source=("https://github.com/dunon/hek/archive/$pkgver.tar.gz")
md5sums=("10122785b3439a9c5d97bb17eaba4278")

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname.py $pkgdir/usr/bin/$pkgname
}
