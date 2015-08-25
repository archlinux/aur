pkgname=ttf-keep-calm-medium
pkgver=1.2
pkgrel=1
pkgdesc="A font developed from the now famous World War 2 poster."
arch=(any)
license=(custom)
depends=(fontconfig xorg-font-utils)
source=("http://www.k-type.com/freefonts/KEEP_CALM_MEDIUM.zip" "license")
md5sums=(b53ffed6598fcfc48665f15cef6ead3d 3d96b169fb7d42077af1865825a00e89)
install=$pkgname.install

package() {
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "$srcdir/license" "$pkgdir/usr/share/licenses/$pkgname/"
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir/KEEP CALM MEDIUM/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}

