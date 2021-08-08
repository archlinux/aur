# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=image-roll-bin
_pkgname="${pkgname%-bin}"
pkgver=1.3.1
pkgrel=1
pkgdesc="A simple and fast GTK image viewer with basic image manipulation tools"
arch=('x86_64')
url="https://github.com/weclaw1/image-roll"
license=('MIT')
depends=('gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname-$pkgver"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/README.md"
        "$pkgname-$pkgver.desktop::https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/src/resources/com.github.weclaw1.ImageRoll.desktop"
        "$pkgname-$pkgver.svg::https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/src/resources/com.github.weclaw1.ImageRoll.svg"
        "$pkgname-$pkgver.xml::https://raw.githubusercontent.com/weclaw1/$_pkgname/$pkgver/src/resources/com.github.weclaw1.ImageRoll.metainfo.xml"
)
sha256sums=('cda29ca3ae82d18eecd89ddc2d5aa6df07ea69c97526609b0154990d41a5fa66'
            'a05b29c2d3db2d0099c21b8bd50618ae6bfdaf6bb4e92cadd94ae673eb5717c6'
            '611335d0701dc46409e3db93b26a45b4ed2840d63941415bc2c46721d353e1e6'
            '612d93113c9eeeb72137054348743d1edaf68dbeb884b489cd64a60473bf4ee6'
            'dd12fa3d3f4c4d64d4c1cdf99fef48b098a6ea069400b4863144f81a4dc8e010'
            '0a2a12c0ea01e18d76c163b102bf55d6b1fb4b4a688643315fbe1cbbe65b5672')

package() {
	install -Dm 755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
	install -Dm 644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 "$pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/com.github.weclaw1.ImageRoll.desktop "
	install -Dm 644 "$pkgname-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.weclaw1.ImageRoll.svg"
	install -Dm 644 "$pkgname-$pkgver.xml" "$pkgdir/usr/share/metainfo/com.github.weclaw1.ImageRoll.metainfo.xml"
}
