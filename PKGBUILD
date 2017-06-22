# Maintainer: Zeph <zeph33@gmail.com>

pkgname=rabbitvcs-nemo
pkgdesc="Nemo front-end for rabbitvcs SVN GIT HG Extension."
pkgver=0.16
pkgrel=3
arch=('any')
url="http://rabbitvcs.org/"
install=$pkgname.install
depends=('nemo-python>=2.0' 'python2-dbus' "rabbitvcs>=$pkgver")
license=('GPL')
_gitcommit="4e94b82e34b409f0baced88521a6e03cb29c4155"
if [ "${_gitcommit}" != "" ]; then
  source=("rabbitvcs-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("rabbitvcs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi
md5sums=('9669132c6ef3f21ecfe1fd96b9be3e0d')

package(){
	install -D "$srcdir/rabbitvcs-$pkgver/clients/nemo/RabbitVCS.py" "$pkgdir/usr/share/nemo-python/extensions/RabbitVCS.py"
}
