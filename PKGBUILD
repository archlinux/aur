# Maintainer: Berhard Landauer <oberon@manjaro.org>

pkgname=samsung_magician
pkgver=2.0
pkgrel=1
pkgdesc="Commandline utility for Samsung PM863 and SM863 Series"
url="http://www.samsung.com"
arch=('x86_64' 'i686')
license=('custom')
depends=('jsoncpp' 'hdparm')
source_x86_64=('http://www.samsung.com/semiconductor/minisite/ssd/downloads/software/Samsung_Magician_DC_Linux_64bit.zip')
md5sums=('138596cfbe00f6b9ead1829b300f5e83')
md5sums_x86_64=('07132c95d8bf88fad498fab4b7864b2e')
md5sums_i686=('1357224cd841ef97b57c1a489e4f37b4'
              '138596cfbe00f6b9ead1829b300f5e83')
source_i686=("http://www.samsung.com/semiconductor/minisite/ssd/downloads/software/Samsung_Magician_DC_Linux_32bit.zip" "LICENSE")
source+=('LICENSE')

package() {
	install -Dm755 magician $pkgdir/usr/bin/magician
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
