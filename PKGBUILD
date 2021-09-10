# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
pkgname=ttf-ingleby
pkgver=1.0
pkgrel=2
pkgdesc='Ingleby font by David Engelby'
arch=('any')
url='https://www.yufont.com/font/8360/Ingleby/'
license=('custom')
source=($pkgname.zip::https://www.yufont.com/font/download/8360/ 'LICENSE')
md5sums=('7e15811f04de4e8b805741fd12d84fb0'
         '5f283b3761250226c5f1316d85cf0265')

package() {
	install -dm755 $pkgdir/usr/share/fonts/TTF
	install -m644 Ingleby/Ingleby_{regular,italic,bold,bold_italic}.ttf $pkgdir/usr/share/fonts/TTF/
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/ttf-ingleby/LICENSE
}
