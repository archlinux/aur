# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=posy-cursors
pkgver=3.7.10
pkgrel=2
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://github.com/Icelk/posy-cursors"
license=(unknown)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('4c9341b74265b65cdac68d0a41515f8b00492add4c2677828626761bfc504af0')

package() {
    echo "-------------------------------------------------------"
    echo "-------------------------------------------------------"
    echo "-------------------------------------------------------"
    ls -l
    echo "-------------------------------------------------------"
    echo "-------------------------------------------------------"
    echo "-------------------------------------------------------"
    ls -l *
    echo "-------------------------------------------------------"
    echo "-------------------------------------------------------"
    echo "-------------------------------------------------------"
    cd $pkgname-$pkgver/themes
    install -Ddm755 "$pkgdir/usr/share/icons"
    cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
    cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
    cp -dr --no-preserve=ownership posy-white-tiny/ "$pkgdir/usr/share/icons/posy-white-tiny"
    cp -dr --no-preserve=ownership posy-black-tiny/ "$pkgdir/usr/share/icons/posy-black-tiny"
}
