# Maintainer: Ye Jingchen <ye.jingchen@gmail.com>

pkgname=ttf-sarasa-gothic
pkgver=0.5.1
pkgrel=1
pkgdesc="A Chinese & Japanese programming font based on Iosevka and Source Han Sans (TTC)"
arch=('any')
url="https://github.com/be5invis/Sarasa-Gothic"
license=('BSD')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/be5invis/Sarasa-Gothic/releases/download/v$pkgver/sarasa-gothic-ttc-$pkgver.7z"
        "https://github.com/be5invis/Sarasa-Gothic/raw/master/LICENSE")
sha256sums=('6d01a57161334173ea87ea8490dbecad95e84f5f8c7f3c09a775353e3ae23543'
            'SKIP')

package() {
	install -d "$pkgdir/usr/share/fonts/TTC"
	install -m644 "$srcdir/"*.ttc "$pkgdir/usr/share/fonts/TTC"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
