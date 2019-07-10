# Maintainer: Josep Oliver Arlès <josep.oliver at tutanota dot com>

pkgname=hek
pkgver=0.0.2
pkgrel=2
pkgdesc="Music library checker"
arch=("any")
url="https://gitlab.com/dunon/hek"
license=("GPL3")
depends=("python" "python-mutagen")
source=("https://gitlab.com/dunon/hek/-/archive/$pkgver/hek-$pkgver.tar.gz")
md5sums=("b195cc1fe5008e42231468d82b61fc44")

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname.py $pkgdir/usr/bin/$pkgname
}
