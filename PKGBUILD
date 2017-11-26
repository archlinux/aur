# Maintainer: Berhard Landauer <oberon@manjaro.org>

_pkgname=samsung_magician
pkgname=$_pkgname-consumer-ssd
pkgver=2.0
pkgrel=1
pkgdesc="CLI tool for Samsung Consumer SSDs including 470, 750, 830, 840, 850, 950 and 960 series"
url="http://www.samsung.com/semiconductor/minisite/ssd"
arch=('x86_64' 'i686')
license=('custom')
depends=('jsoncpp' 'hdparm')
conflicts=("$_pkgname")
source=('LICENSE')
md5sums=('138596cfbe00f6b9ead1829b300f5e83')
md5sums_x86_64=('07132c95d8bf88fad498fab4b7864b2e')
md5sums_i686=('1357224cd841ef97b57c1a489e4f37b4')
source_x86_64=("$url/downloads/software/Samsung_Magician_DC_Linux_64bit.zip")
source_i686=("$url/downloads/software/Samsung_Magician_DC_Linux_32bit.zip")

package() {
	install -Dm755 magician $pkgdir/usr/bin/magician
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
