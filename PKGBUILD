# Maintainer: Elrondo46 <elrond94@hotmail.com> 
# Contributor: lagout <admin@lagout.ovh>

pkgname=ut1999
pkgver=99
pkgrel=1
_build=451
pkgdesc="Unreal Tournament first version"
url="https://epicgames.com/"
arch=('i686' 'x86_64')
license=('custom')
#conflicts=
#depends=
makedepends=('xdelta' 'gtk' 'glib')
source=("http://unreal.lagout.ovh/ut${pkgver}-build${_build}.tar.gz")
md5sums=('e183919c73814bbf83beb944e17c5ec2')
install="$pkgname.install"
package() {
	cd "$srcdir"
	tar xvzf ut99451.tar.gz -C $pkgdir
	install -d 775 $pkgdir/opt/
	install -d 755 $pkgdir/usr/
}
