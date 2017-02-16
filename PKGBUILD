# Maintainer: Chang.YC <chang.yc@outlook.com>

pkgname=drcom-cauc
pkgver=0.1
pkgrel=1
pkgdesc="3rd Party Dr.COM Client for CAUC"
arch=('i686' 'x86_64')
url="https://github.com/carlsplace/drcom-cauc"
license=('GPLv2')
depends=('python2')
makedepends=('make' 'git')
optdepends=()
provides=('drcom-cauc')
conflicts=()
# install=drcom.install
source=("$pkgname"::'git+https://github.com/carlsplace/drcom-cauc.git#branch=master')
noextract=()
md5sums=('SKIP')

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
