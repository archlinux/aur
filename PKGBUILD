# Maintainer: DuckSoft <realducksoft@gmail.com>
pkgname=ttf-menksoft
pkgver=1.02
pkgrel=1
pkgdesc="蒙科立标准编码字库"
arch=(any)
url=http://www.menksoft.com/
license=(custom)
depends=(fontconfig xorg-font-utils)
source=(
    http://www.menksoft.com/Portals/_MenkCms/Products/Fonts/MenksoftOpenType1.02.zip
    Menksoft.LICENSE
)
b2sums=(
    e79de87572b850bf25b25b510847edc3b0bf6502761dd42a3f268aeeabb2030f17dd7b43acd1af745a1f766c192e23dbfa1eda686e914e86202b718e87bf2f11
    f1229d0e5d291d87cf9c9141bfb24bacc0f0fc72769ef8bdb668549c79ac81aea9761f23234c7bcdde9da177b4451cc42173cddba18ef017e2fdbd2c361c955c
)

package() {
    install -Dm644 -t $pkgdir/usr/share/licenses/ttf-menksoft $srcdir/Menksoft.LICENSE
	install -Dm644 -t $pkgdir/usr/share/fonts/TTF/ $srcdir/MenksoftOpenType1.02/*.ttf
}
