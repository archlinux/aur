# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-persian-hm-ftx
pkgver=2.9
pkgrel=1
pkgdesc="An improved and corrected font series derived from ttf-x2 Persian font series, Metafont and FarsiTeX fonts with Kashida feature."
arch=('any')
url="http://dma8hm1334.bitbucket.org/persian-hm-ftx/index.html"
license=('custom:OFL')
groups=('persian-fonts')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("$pkgname-$pkgver.7z::https://bitbucket.org/dma8hm1334/persian-hm-ftx-$pkgver/downloads/persian-hm-ftx-$pkgver.7z")
md5sums=('2e6a861cef1fbcb24dcf2fb0e522a338')

package() {
	cd $srcdir/persian-hm-ftx-$pkgver
	install -d $pkgdir/usr/share/{fonts,licenses}/$pkgname/
	install -m644 fonts/Ttf/*.ttf $pkgdir/usr/share/fonts/$pkgname/ 
    install -m644 OFL.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
