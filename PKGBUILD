# Maintainer: Wu Yufei <me@tespent.cn>

pkgname=zjunet
pkgver=0.3.3
pkgrel=4
pkgdesc="Command Line Scripts for ZJU"
url="https://github.com/QSCTech/zjunet"
arch=('any')
license=('GPL')
depends=('xl2tpd>=1.3.7' 'curl' 'dnsutils')
source=("zjunet-0.3.3-4.tar.gz::https://github.com/QSCTech/zjunet/archive/v0.3.3-4.tar.gz")
md5sums=('a31aa402bd77f5b2325ebd8d659a5724')
sha1sums=('7fae6558d3bec8631fe1aa12495aa64bedb323da')
sha256sums=('9a138b02f33d12d5fff3c405c38a56626fc8448dd842767f2192a290daefc03b')

package() {
	cd "$srcdir/zjunet-0.3.3-4"
	DESTDIR=$pkgdir PREFIX=/usr ./install.sh
}
