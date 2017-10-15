# Maintainer: Scott Dickson <scottfoesho@gmail.com>

pkgname=muximux
pkgver=2.0
pkgrel=1
pkgdesc='A Lightweight portal to your webapps'
arch=('any')
url='https://github.com/mescon/Muximux'
license=('GPL2')
depends=('php')
optdepends=('apache: Web server to run Muximux'
            'nginx: Web server to run Muximux'
	    'cherokee: Web server to run Muximux')
install="$pkgname.install"
source=("https://github.com/mescon/Muximux/archive/v${pkgver}.tar.gz")
sha256sums=('5d422c2de809a7d69036ac877c3bd1034298dad2ab436637b25b973fc1bd95db')

package() {
  cd "${srcdir}/Muximux-$pkgver"
  install -d "$pkgdir/usr/share/webapps/muximux"
  cp -r . "$pkgdir/usr/share/webapps/muximux/"
}
