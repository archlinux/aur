# Contributor: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>

pkgname=fightcade
pkgver=42.1
pkgrel=1
pkgdesc='An online arcade gaming platform for netplay based on GGPO'
url='http://www.fightcade.com/'
arch=('any')
license=('GPLv2')
depends=(wine lib32-mpg123 pyqt4-common python-pyqt4 phonon-qt4 python2-pyqt4 python2-sip)
source=(http://www.fightcade.com/download/fightcade-linux-v042.1.tar.gz)
md5sums=('54ce821aa84738ade05e3654446fd19a')

package() {
	cd $srcdir/FightCade
	install -dm755 $pkgdir/opt/
	cp -r $srcdir/FightCade $pkgdir/opt/$pkgname
}
