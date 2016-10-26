# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=deluge-plugins-autoremoveplus
pkgver=0.6.1
pkgrel=1
pkgdesc="AutoRemovePlus is a plugin for Deluge that you can use to automatically remove torrents"
arch=('any')
url="https://github.com/omaralvarez/deluge-autoremoveplus"
license=(GPL3)
depends=('deluge')
source=($url/releases/download/$pkgver/AutoRemovePlus-$pkgver-py2.7.egg)
md5sums=('28416e2e49ed5c82c9b64029273d2618')
noextract=(AutoRemovePlus-$pkgver-py2.7.egg)

package() {
	install -Dm644 AutoRemovePlus-$pkgver-py2.7.egg "$pkgdir"/usr/lib/python2.7/site-packages/deluge/plugins/AutoRemovePlus-$pkgver-py2.7.egg
}
