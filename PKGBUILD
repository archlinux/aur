# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=kwin-scripts-truely-maximized
pkgver=1.1.0
pkgrel=1
pkgdesc="A Kwin script that truely maximizes your screen space by hiding the title bars of your windows when they are maximized."
arch=('any')
url='https://github.com/fin444/truely-maximized'
license=("GPL")
depends=('kwin')
source=("$url/releases/download/v$pkgver/truely-maximized.kwinscript")
sha512sums=('10ca4e18d590dfea40237359ad5de18e830b9e453e20a4aff640fa3fb916cb6a8791929846c71a8029b2d418edbb9127d9fcdeeb624942a29212aaf1137719bc')

package() {
	kpackagetool6 -t KWin/Script -p $pkgdir/usr/share/kwin/scripts -i truely-maximized.kwinscript
}
