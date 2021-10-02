# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
# Contributor: f4iqn <f4iqn@f6kgl.ampr.org>
pkgname=yahpt-git
pkgver=20211002
pkgrel=1
pkgdesc="Yet Another HF Propagation Tool"
arch=('any')
license=('GPL3')
depends=('python' 'python-requests' 'python-gobject' 'python-pillow')
url="https://gitlab.com/f4iey/yahpt.git"
source=($pkgname::"git+$url")

sha256sums=('SKIP')

package() {
        cd $srcdir/$pkgname
        install -dm755 $pkgdir/opt/cqrprop
	install -dm755 $pkgdir/usr/bin/
        cp src/cqrprop.py $pkgdir/opt/cqrprop/
	cp bin/yahpt $pkgdir/usr/bin

}
