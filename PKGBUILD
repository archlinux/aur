pkgname=pixivdeck-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="pixiv client for Desktop like TweetDeck"
arch=("x86_64")
url="https://github.com/akameco/PixivDeck"
license=("MIT")
depends=("electron")
provides=("pixivdeck")
conflicts=("pixivdeck")
source=("https://github.com/akameco/PixivDeck/releases/download/v$pkgver/PixivDeck_${pkgver}_amd64.deb" "license")
md5sums=("SKIP" "SKIP")

package(){
tar xf data.tar.xz -C "${pkgdir}"
mkdir $pkgdir/usr/bin
ln -sf ${pkgdir}"/opt/PixivDeck/pixivdeck" $pkgdir"/usr/bin/pixivdeck"
mkdir -p $pkgdir/usr/share/licenses/pixivdeck-bin/
cp license $pkgdir/usr/share/licenses/pixivdeck-bin/license
}
