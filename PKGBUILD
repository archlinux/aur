#Maintainer: Zachary Jordan <zacjor1 at gmail dot com>
#PKGBUILD based off https-everywhere-chrome from Yardena Cohen <yardenack at gmail dot com>

pkgsubn=Banchecker_Chrome_
pkgname=chromium-extension-ban-checker-for-steam
pkgver=1.2.2.1
pkgrel=1
pkgdesc="Chrome/Chromium extension for Ban-Checker-for-Steam"
arch=('any')
url='https://github.com/ge-ku/Ban-Checker-for-Steam'
license=('custom')
source=("https://github.com/ge-ku/Ban-Checker-for-Steam/releases/download/${pkgver}/Banchecker_Chrome_${pkgver}.zip")
md5sums=('7299150b8483063928759cd085fd077f')

package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership $srcdir/* $pkgdir/usr/share/$pkgname
	 rm -f $pkgdir/usr/share/$pkgname/$pkgsubn$pkgver.zip
}
