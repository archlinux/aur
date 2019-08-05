# Maintainer: Josep Oliver Arlès <josep.oliver at tutanota dot com>

pkgname=hek
pkgver=0.1.4
pkgrel=1
pkgdesc="Music library checker"
arch=("any")
url="https://gitlab.com/dunon/hek"
license=("GPL3")
depends=("python" "python-mutagen")
source=("https://gitlab.com/dunon/hek/-/archive/$pkgver/hek-$pkgver.tar.gz")
md5sums=("5972f1815df64f4fde7de3d108fe6ad5")

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname.py $pkgdir/usr/bin/$pkgname
}
