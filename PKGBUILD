# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=posy-cursors
pkgver=3.7.10
pkgrel=1
pkgdesc="Port of Posy's improved cursors"
arch=(any)
url="https://gitlab.com/ykkzde/posy-cursors"
license=(unknown)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/v$pkgver/posy-cursors-v$pkgver.tar.gz?path=themes") # automatically set in CI, see: /.gitlab-ci.yml

sha256sums=('SKIP') # automatically set in CI, see: /.gitlab-ci.yml

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
    cd $pkgname-v$pkgver-themes/themes
    install -Ddm755 "$pkgdir/usr/share/icons"
    cp -dr --no-preserve=ownership posy-white/ "$pkgdir/usr/share/icons/posy-white"
    cp -dr --no-preserve=ownership posy-black/ "$pkgdir/usr/share/icons/posy-black"
    cp -dr --no-preserve=ownership posy-white-tiny/ "$pkgdir/usr/share/icons/posy-white-tiny"
    cp -dr --no-preserve=ownership posy-black-tiny/ "$pkgdir/usr/share/icons/posy-black-tiny"
}
