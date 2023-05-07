# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="snowball-appimage"
pkgver=1.4.0
pkgrel=1
pkgdesc="Find and filter literature, fast"
url="https://github.com/shaunabanana/snowball"
license=("custom:none")
arch=("x86_64")
depends=("fuse2")
source=("$url/releases/download/v$pkgver/Snowball-$pkgver.AppImage"
        "snowball.desktop"
        "snowball.png")
sha256sums=('1397f77e84c62f7206ecc2c11226b8491236bb4fe5bb52ce6473e6200525f3c3'
            '4d88385a4c9f8557b0c231281eba34026e74cd4ddb02a014eaa5f40f7764b151'
            '15976501a5086fc900c2720e66dff9363702667c437bbaba210e3db860385632')
options=("!strip")

package(){
 install -D -m 755 "Snowball-$pkgver.AppImage" "$pkgdir/usr/bin/snowball-appimage"
 install -D -m 644 "snowball.desktop" "$pkgdir/usr/share/applications/snowball.desktop"
 install -D -m 644 "snowball.png" "${pkgdir}/usr/share/pixmaps/snowball.png"
}

