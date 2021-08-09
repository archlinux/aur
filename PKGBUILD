# Maintainer: Barfin

pkgname=ttf-segoewp
pkgver=1.0
pkgrel=1
pkgdesc='SegoeWP font family'
arch=('any')
url="unknown"
license=('unknown')
provides=('ttf-font')
source=("http://download752.mediafire.com/emn1prku5wrg/k4makp2pk726bmb/Fonts.zip")
sha256sums=('68851eb60d7656e8bb08f5f1eda70e0ef7b14cbf344002ca59cacdc3e1dc737c')

package() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
}
