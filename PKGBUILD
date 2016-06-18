# Maintainer:  bartekww

pkgname=samsung_magician
pkgver=v2.0
pkgrel=0
pkgdesc="Utility for Samsung SSDs".
url="http://www.samsung.com/"
arch=('x86_64' 'i686')
license=('custom')
depends=('jsoncpp' 'hdparm')
source_x86_64=("http://www.samsung.com/semiconductor/minisite/ssd/downloads/software/Samsung_Magician_DC_Linux_64bit.zip" "LICENSE")
md5sums_x86_64=('07132c95d8bf88fad498fab4b7864b2e' '138596cfbe00f6b9ead1829b300f5e83')
source_i686=("http://www.samsung.com/semiconductor/minisite/ssd/downloads/software/Samsung_Magician_DC_Linux_32bit.zip" "LICENSE")
md5sums_i686=('1357224cd841ef97b57c1a489e4f37b4' '138596cfbe00f6b9ead1829b300f5e83')



package() {
	install -Dm 755 magician ${pkgdir}/usr/bin/magician
	install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
