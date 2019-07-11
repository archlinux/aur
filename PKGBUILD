# Maintainer: Josep Oliver Arlès <josep.oliver at tutanota dot com>

pkgname=hek
pkgver=0.0.3
pkgrel=1
pkgdesc="Music library checker"
arch=("any")
url="https://github.com/dunon/hek"
license=("GPL3")
depends=("python" "python-mutagen")
source=("https://github.com/dunon/hek/archive/$pkgver.tar.gz")
md5sums=("0b639f18015e7c168664c24c0c69e298")

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname.py $pkgdir/usr/bin/$pkgname
}
