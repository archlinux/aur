pkgname=kanjistrokeorders-ttf
pkgver=3.001
pkgrel=1
pkgdesc="Kanji stroke order font"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://www.nihilist.org.uk/"
source=("https://dl.dropboxusercontent.com/u/39004158/KanjiStrokeOrders_v3.001.zip")
sha256sums=("2da23900bcb6e1a47dce11c5d2acb1e45024c5015459e6fb290d5eadc8632fbe")
license=('BSD')


install=$pkgname.install

package() {
    install -D -m644 KanjiStrokeOrders_v3.001.ttf "${pkgdir}/usr/share/fonts/TTF/kanjistrokeorders.ttf"
    install -D -m644 copyright.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
