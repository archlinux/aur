# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=argon
pkgver=2.0
pkgrel=3
pkgdesc="the noble lightweight GUI package manager + update notifier (with full AUR support)"
url="http://code.google.com/p/arch-argon/"
license=('GPL')
arch=('any')
depends=(bash cower pacaur libnotify python python-gobject gtk3 vte3)
source=(http://arch-argon.googlecode.com/git/tarballs/argon-2.0.tar.gz)

package() {
cd ${srcdir}/${pkgname}-${pkgver}
make DESTDIR="$pkgdir/" install
}

md5sums=('90bae83ce06d2124a169a8ed3b4db8cf')
