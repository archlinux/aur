# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=deluge-plugins-autoremoveplus
pkgver=0.5.1
pkgrel=1
pkgdesc="AutoRemovePlus is a plugin for Deluge that you can use to automatically remove torrents"
arch=('any')
url="https://github.com/omaralvarez/deluge-autoremoveplus"
license=(GPL3)
depends=('deluge')
source=($url/releases/download/v$pkgver/AutoRemovePlus-$pkgver-py2.7.egg)
md5sums=('4efb70b58d1d244b89bbbfcb617edc6e')
noextract=(AutoRemovePlus-$pkgver-py2.7.egg)

package() {
	install -Dm644 AutoRemovePlus-$pkgver-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/deluge/plugins/AutoRemovePlus-$pkgver-py2.7.egg
}
