pkgname="ttf-victor-mono"
pkgdesc="Unoffical Victor Mono(TTF) AUR package"
pkgver=1.5.6
pkgrel=1
arch=("any")
sha256sums=("e7502e2aeaaf579ea9c790bee4088454e86d8a3bd1d6757145fb18a33ae90608")
url="https://rubjo.github.io/victor-mono/"
source=("$pkgname-$pkgver.zip::https://github.com/rubjo/victor-mono/archive/refs/tags/v$pkgver.zip")
license=("custom:OFL")

prepare() {
   bsdtar -xf "$srcdir/victor-mono-$pkgver/public/VictorMonoAll.zip" -C VictorMonoAll
}

package(){
   install -d "$pkgdir/usr/share/fonts/TTF/" # Make sure /usr/share/fonts/TTF exists
   install -m644 VictorMonoAll/TTF/*.ttf" $pkgdir/usr/share/fonts/TTF/"
}
