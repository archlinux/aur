# Maintainer: Josep Oliver Arlès <josep.oliver at tutanota dot com>

pkgname=hek
pkgver=0.1.3
pkgrel=1
pkgdesc="Music library checker"
arch=("any")
url="https://github.com/dunon/hek"
license=("GPL3")
depends=("python" "python-mutagen")
source=("https://github.com/dunon/hek/archive/$pkgver.tar.gz")
md5sums=("f7d1f9803d8a2a00dec78bc43fa3b73d")

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname.py $pkgdir/usr/bin/$pkgname
}
