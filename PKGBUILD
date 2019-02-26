# Maintainer: Berhard Landauer <oberon@manjaro.org>

pkgname=samsung-ssd-dc-toolkit
pkgver=2.1
pkgrel=1
pkgdesc="Samsung magician. CLI tool for SSD Data Centers 983 ZET, 983 DCT, 883 DCT and 860 DCT"
url="https://www.samsung.com/semiconductor"
arch=('x86_64' 'i686')
license=('custom')
depends=('jsoncpp' 'hdparm')
conflicts=('samsung_magician-consumer-ssd')
source=("$url/global.semi.static/Samsung_SSD_DC_Toolkit_for_Linux_V$pkgver"
        'LICENSE')
md5sums=('4311a4b3da567dc854fd07b7cf35b304'
         '138596cfbe00f6b9ead1829b300f5e83')

package() {
	install -Dm755 Samsung_SSD_DC_Toolkit_for_Linux_V2.1 $pkgdir/usr/bin/$pkgname
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    cd $pkgdir/usr/bin
    ln -s $pkgname magician
}
