# Maintainer: Berhard Landauer <oberon@manjaro.org>

_pkgname=samsung_magician
pkgname=$_pkgname-consumer-ssd
pkgver=1.0
pkgrel=1
pkgdesc="CLI tool for Samsung Consumer SSDs including 470, 750, 830, 840, 850, 950 and 960 series"
url="http://www.samsung.com/semiconductor/minisite/ssd/download/tools.html"
arch=('x86_64' 'i686')
license=('custom')
depends=('jsoncpp' 'hdparm')
conflicts=("$_pkgname")
source=('LICENSE')
md5sums=('138596cfbe00f6b9ead1829b300f5e83')
md5sums_x86_64=('f2ff15d1c5bb316f58d615203ab9b111')
md5sums_i686=('d1e51e912994000cc8ce8ec8fc86751b')
source_x86_64=('https://www.dropbox.com/s/jo5l1ihyxta47qy/Samsung_Magician_DC_Linux_64bit.zip')
source_i686=('https://www.dropbox.com/s/jhc76a921v049rj/Samsung_Magician_DC_Linux_32bit.zip')

package() {
	install -Dm755 magician $pkgdir/usr/bin/magician
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
