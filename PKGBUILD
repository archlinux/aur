pkgname=pixivdeck-bin
pkgver=1.4.0
pkgrel=3
pkgdesc="pixiv client for Desktop"
arch=("x86_64")
url="https://github.com/akameco/PixivDeck"
license=("MIT")
depends=("gconf" "libnotify" "libxtst" "libxss")
provides=("pixivdeck")
conflicts=("pixivdeck")
source=("https://github.com/akameco/PixivDeck/releases/download/v$pkgver/PixivDeck_${pkgver}_amd64.deb" "license")
md5sums=('13d33debdc52fadd69b3d7f7a45b1a74'
         'faad6836e14feafcac439cfcad02ffbd')
install=${pkgname}.install

package(){
tar xf data.tar.xz -C "${pkgdir}"
mkdir -p $pkgdir/usr/share/licenses/pixivdeck-bin/
cp license $pkgdir/usr/share/licenses/pixivdeck-bin/license
}
