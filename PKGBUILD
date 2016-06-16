# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-persian-hm-xs2
pkgver=2.9
pkgrel=1
pkgdesc="An improved and corrected font series derived from ttf-x2 Persian font series with Kashida feature."
arch=('any')
url="http://dma8hm1334.bitbucket.org/persian-hm-xs2/index.html"
license=('custom:OFL')
groups=('persian-fonts')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("$pkgname-$pkgver.7z::https://bitbucket.org/dma8hm1334/persian-hm-xs2-$pkgver/downloads/persian-hm-xs2-$pkgver.7z")
md5sums=('7bac02779cd4eec2a59ed257ffd96623')

package() {
	cd $srcdir/persian-hm-xs2-$pkgver
	install -d $pkgdir/usr/share/{fonts,licenses}/$pkgname/
	install -m644 fonts/Ttf/*.ttf $pkgdir/usr/share/fonts/$pkgname/ 
    install -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
