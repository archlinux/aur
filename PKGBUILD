# Maintainer: Ye Jingchen <ye.jingchen@gmail.com>

pkgname=ttf-sarasa-gothic
pkgver=0.2.1
pkgrel=1
pkgdesc="A Chinese & Japanese programming font based on Iosevka and Source Han Sans"
arch=('any')
url="https://github.com/be5invis/Sarasa-Gothic"
license=('BSD')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v$pkgver/sarasa-gothic-$pkgver.7z"
        "https://github.com/be5invis/Sarasa-Gothic/raw/master/LICENSE")
sha256sums=('b502a60095451cd64ad258ebffe1f18631806cd6c80f1cae6dd1cc92c5544b33'
            'SKIP')

package() {
	install -d "$pkgdir/usr/share/fonts/TTC"
	install -m644 "$srcdir/sarasa/"*.ttc "$pkgdir/usr/share/fonts/TTC"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
