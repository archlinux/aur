# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname=("ttf-miracode")
pkgver=1.0
pkgrel=1
pkgdesc="A sharp, readable, vector-y version of Monocraft, the monospace programming font based on Minecraft"
url="https://github.com/IdreesInc/Miracode"
license=("OFL")
arch=("any")
source=("https://github.com/IdreesInc/Miracode/releases/download/v$pkgver/Miracode.ttf"
        "https://raw.githubusercontent.com/IdreesInc/Miracode/main/LICENSE")
b2sums=('18aba89d62510a7f559e5696be06043f3f9a98efadbe4643e10f56fcf487ecedae874bdd462964e7f85edbc024a92ad2e874fb885cbf07e522779ce65afba4bf'
        'SKIP')

package(){
 install -D -m 644 "Miracode.ttf" -t "$pkgdir/usr/share/fonts/TTF" 
 install -D -m 644 "LICENSE"      -t "$pkgdir/usr/share/licenses/$pkgname"
}
