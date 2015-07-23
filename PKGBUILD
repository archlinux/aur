# $Id$
# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=sdedit
_ver=4.0
pkgver=${_ver}1
_ver_download=1
pkgrel=1
pkgdesc="Lightweight sequence diagram editor"
arch=('any')
url="http://sdedit.sourceforge.net"
license=('BSD')
depends=('java-runtime' 'bash')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${_ver}/$pkgname-$_ver$_ver_download.jar"
	"sdedit.sh"
)
md5sums=('57932b49bdfc4d2503f570c262eeb096'
         'df660cb818236d83567cefc50742ca88')
noextract=("$pkgname-$_ver$_ver_download.jar")

package() {
  install -Dm755 "$srcdir/sdedit.sh" "$pkgdir/usr/bin/sdedit"
  install -Dm644 "$srcdir/$pkgname-$_ver$_ver_download.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}
